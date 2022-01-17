//
//  CreateObjectMessage.swift
//  NetSceneServer
//
//  Created by Taha Moujtahid on 12.01.22.
//

import Foundation

struct CreateObjectMessage : Codable , NetMessage{
    static var messageType = "CreateObjectMessage"
    var entityID : String
    var objectType : String
    var objectData : SceneObjectData
}

extension NetSceneServerMessageHandler {
    func handleMessage(client: NetSceneClient, _ message : CreateObjectMessage?){
        if let message = message {
            let sceneObject = SceneObject(objectType: message.objectType)
            sceneObject.id = message.entityID
            sceneObject.setData(message.objectData)
            if(client.lobby != nil && client.lobby!.scene.addObject(sceneObject)){
                client.lobby?.broadcastMessage(try! JSONEncoder().encode(message), onSended: nil)
            }else{
                print("client: \(client.id) tried to create a gameObject without being assigned to a lobby!")
            }
        }else{
            print("CreateObjectMessage with insufficient data")
        }
    }
}
