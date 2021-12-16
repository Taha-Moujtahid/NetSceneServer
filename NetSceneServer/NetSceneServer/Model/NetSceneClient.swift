//
//  NetSceneClient.swift
//  NetSceneServer
//
//  Created by Taha Moujtahid on 01.12.21.
//

import Foundation
import Network

let LocalNetSceneConnection = NWConnection(host: "localhost", port: NWEndpoint.Port(51211), using: .udp)

struct NetSceneClient : Identifiable{
    let id = UUID().uuidString
    let connection : NWConnection
    var lobby : Lobby?
    
    init(connection: NWConnection){
        self.connection = connection
    }
    
    
    func send(_ data : Data , onSended: ( ()->() )? ){
        
        connection.send(content: data, completion: .contentProcessed({ error in
            if error != nil {
                print(error!)
            }else{
                onSended?()
                print("\(data) send!")
            }
        }))
        
    }
    
    func setOnReceive(_ onReceive : @escaping (Data)->()){
        connection.receiveMessage { completeContent, contentContext, isComplete, error in
            if error == nil {
                onReceive(completeContent!)
            }else{
                print(error!)
            }
        }
    }
}
