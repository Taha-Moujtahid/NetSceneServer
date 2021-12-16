//
//  Lobby.swift
//  NetSceneServer
//
//  Created by Taha Moujtahid on 01.12.21.
//

import Foundation

class Lobby : Identifiable , ObservableObject{
    
    var id = UUID().uuidString
    
    var name : String?
    var clients : [NetSceneClient]
    var scene : Scene
    
    init(){
        clients = [NetSceneClient]()
        scene = Scene()
    }
    
    init(scene: Scene){
        clients = [NetSceneClient]()
        self.scene = scene
    }
    
    func setName(_ name : String){
        self.name = name
    }
    
    func addClient(_ client: NetSceneClient) -> Bool{
        if(clients.contains(where: { c in c.id == client.id })){
            return false
        }else{
            clients.append(client)
            return true
        }
    }
    
    func removeClient(_ client: NetSceneClient){
        clients.removeAll{ c in
            c.id == client.id
        }
    }
    
    func broadcastSceneObject(_ sceneObject: SceneObject){
        clients.forEach { client in
            try! client.send(JSONEncoder().encode(sceneObject.data), onSended: nil)
        }
    }
    
    
    
}
