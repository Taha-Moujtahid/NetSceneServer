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
    
    static var clients = [NetSceneClient]()
    
    static func startServer(){
        print("Starting the Server")
        if(NetSceneServer.listener == nil){
            NetSceneServer.listener = try! NWListener(using: NWParameters.tcp, on: NWEndpoint.Port(51211))
        }
        
        if(NetSceneServer.listener!.state != .ready){
            NetSceneServer.listener!.newConnectionHandler = { connection in
                connection.start(queue: queue)
                let newClient = NetSceneClient(connection: connection)
                receiveNextMessage(client: newClient)
                clients.append(newClient)
            }
        
            NetSceneServer.listener!.start(queue: queue)
        }else{
            print("Server already started...")
        }
    }
    
    static func stopServer(){
        print("Stopping the Server")
        clients.forEach { client in
            client.connection.cancel()
        }
        
        NetSceneServer.listener?.cancel()
        NetSceneServer.listener = nil
    }
    
    static func receiveNextMessage(client: NetSceneClient){
        client.connection.receiveMessage { completeContent, contentContext, isComplete, error in
            if completeContent != nil {
                messageHandler.handleData(client: client, data: completeContent!)
                receiveNextMessage(client: client)
            }
        }
    }
    
}
