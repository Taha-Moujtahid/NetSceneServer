//
//  UnlockEntityMessage.swift
//  NetSceneServer
//
//  Created by Taha Moujtahid on 12.01.22.
//

import Foundation

struct UnlockEntityMessage : Codable , NetMessage{
    static var messageType = "CreateObjectMessage"
    var entityID : String
}

struct UnlockEntityResponse : Codable, NetMessage {
    static var messageType = "UnlockEntityResponse"
    var success : Bool
}

extension NetSceneServerMessageHandler {
    func handleMessage(client: NetSceneClient, _ message : UnlockEntityMessage?){
        if let message = message {
            if let success = client.lobby?.scene.getObject(message.entityID)?.unlock(by: client.id){
                client.send(try! JSONEncoder().encode(UnlockEntityResponse(success: success)), onSended: nil)
            }else{
                client.send(try! JSONEncoder().encode(UnlockEntityResponse(success: false)), onSended: nil)
            }
        }else{
            print("Join Message with insufficient data")
        }
    }
}
