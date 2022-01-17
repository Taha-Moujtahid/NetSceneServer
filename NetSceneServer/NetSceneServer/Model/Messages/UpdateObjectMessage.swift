//
//  UpdateObjectMessage.swift
//  NetSceneServer
//
//  Created by Taha Moujtahid on 12.01.22.
//

import Foundation

struct UpdateObjectMessage : Codable , NetMessage{
    static var messageType = "UpdateObjectMessage"
    var entityID : String
    var objectData : SceneObjectData
}

extension NetSceneServerMessageHandler {
    func handleMessage(client: NetSceneClient, _ message : UpdateObjectMessage?){
        if let message = message {
            if let sceneObject = client.lobby?.scene.getObject(message.entityID) {
                sceneObject.setData(message.objectData)
                client.lobby?.broadcastMessage(try! JSONEncoder().encode(message), onSended: nil)
            }
        }else{
            print("UpdateObjectMessage with insufficient data")
        }
    }
}
