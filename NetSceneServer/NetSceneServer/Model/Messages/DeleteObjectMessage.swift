//
//  DeleteObjectMessage.swift
//  NetSceneServer
//
//  Created by Taha Moujtahid on 12.01.22.
//

import Foundation

struct DeleteObjectMessage : Codable , NetMessage{
    static var messageType = "DeleteObjectMessage"
    var entityID : String
}

extension NetSceneServerMessageHandler {
    func handleMessage(client: NetSceneClient, _ message : DeleteObjectMessage?){
        if let message = message {
            if let _ = client.lobby?.scene.getObject(message.entityID)?.unlock(by: client.id) {
                client.lobby!.scene.removeObject(entityID: message.entityID)
                client.lobby!.broadcastMessage(try! JSONEncoder().encode(message), onSended: nil)
            }else{
                print("client: \(client.id) tried to delete Object: \(message.entityID) without success!")
            }
        }else{
            print("DeleteObjectMessage with insufficient data")
        }
    }
}
