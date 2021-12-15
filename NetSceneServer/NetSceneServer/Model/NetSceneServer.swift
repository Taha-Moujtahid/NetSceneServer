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
    
    static var shared = try! NetSceneServer()
    var listener : NWListener?
    var queue : DispatchQueue?
    
    @Published var lobbies = [Lobby]()
    
    init() throws {
        print("Starting server")
        do{
            listener = try NWListener(using: NWParameters.tcp, on: NWEndpoint.Port(51211))
            queue = DispatchQueue(label: "ServerQueue")
        }
    }
    
    func startServer(){
        if(listener != nil && self.queue != nil){
            listener!.newConnectionHandler = { connection in
                connection.start(queue: self.queue!)
            }
            
            listener!.stateUpdateHandler = { state in
                print(state)
            }
        
            listener!.start(queue: self.queue!)
        }
    }
    
    func createLobby(){
        lobbies.append(Lobby())
    }
    
    
}
