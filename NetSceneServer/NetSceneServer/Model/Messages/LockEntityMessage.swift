//
//  LockEntityMessage.swift
//  NetSceneServer
//
//  Created by Taha Moujtahid on 12.01.22.
//

import Foundation

struct LockEntityMessage : Codable , NetMessage{
    static var messageType = "LockEntityMessage"
    var entityID : String
}

struct LockEntityResponse : Codable , NetMessage{
    static var messageType = "LockEntityResponse"
    var success : Bool
}

extension NetSceneServerMessageHandler {
    func handleMessage(client: NetSceneClient, _ message : LockEntityMessage?){
        if let message = message {
            if let success = client.lobby?.scene.getObject(message.entityID)?.lock(by: client.id){
                client.send(try! JSONEncoder().encode(LockEntityResponse(success: success)), onSended: nil)
            }else{
                client.send(try! JSONEncoder().encode(LockEntityResponse(success: false)), onSended: nil)
            }
        }else{
            print("Join Message with insufficient data")
        }
    }
}
