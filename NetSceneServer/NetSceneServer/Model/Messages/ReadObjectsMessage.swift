//
//  ReadObjectsMessage.swift
//  NetSceneServer
//
//  Created by Taha Moujtahid on 12.01.22.
//

import Foundation

struct ReadObjectsMessage : Codable , NetMessage{
    static var messageType = "ReadObjectsMessage"
}

struct ReadObjectsResponse : Codable, NetMessage{
    static var messageType = "ReadObjectsResponse"
    var objects : [SceneObjectData]
}

extension NetSceneServerMessageHandler {
    func handleMessage(client: NetSceneClient, _ message : ReadObjectsMessage?){
        if let sceneObjects = client.lobby?.scene.objects.map({ sceneObject in sceneObject.getData() }){
            client.send(try! JSONEncoder().encode(ReadObjectsResponse(objects: sceneObjects)), onSended: nil)
        }
    }
}
