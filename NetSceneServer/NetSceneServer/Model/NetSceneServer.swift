//
//  NetSceneServer.swift
//  NetSceneServer
//
//  Created by Taha Moujtahid on 01.12.21.
//

import Foundation
import Network

class NetSceneServer : ObservableObject {
    
    enum ServerError : Error {
        case InitialisationError
    }
    
    static let messageHandler = NetSceneServerMessageHandler()
    
    static var listener : NWListener? = try! NWListener(using: NWParameters.udp, on: NWEndpoint.Port(51211))
    static let queue = DispatchQueue(label: "ServerQueue")
    
    static var connections = [NWConnection]()
    
    static func startServer(){
        print("Starting the Server")
        if(NetSceneServer.listener == nil){
            NetSceneServer.listener = try! NWListener(using: NWParameters.udp, on: NWEndpoint.Port(51211))
        }
        
        if(NetSceneServer.listener!.state != .ready){
            NetSceneServer.listener!.newConnectionHandler = { connection in
                connection.start(queue: queue)
                connection.send(content: "Server reachable: Welcome".data(using: .ascii), completion: .idempotent)
                setupClientReceiver(connection: connection)
                connections.append(connection)
            }
        
            NetSceneServer.listener!.start(queue: queue)
        }else{
            print("Server already started...")
        }
    }
    
    static func stopServer(){
        print("Stopping the Server")
        connections.forEach { connection in
            connection.cancel()
        }
        
        NetSceneServer.listener?.cancel()
        NetSceneServer.listener = nil
    }
    
    static func setupClientReceiver(connection: NWConnection){
        connection.receiveMessage { completeContent, contentContext, isComplete, error in
            if completeContent != nil {
                print(String(data: completeContent!, encoding: .ascii))
                
                messageHandler.handleData(completeContent!)
                
                
                setupClientReceiver(connection: connection)
            }
        }
    }
    
}
