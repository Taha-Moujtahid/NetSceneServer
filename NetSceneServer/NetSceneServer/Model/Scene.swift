//
//  Scene.swift
//  NetSceneServer
//
//  Created by Taha Moujtahid on 01.12.21.
//

import Foundation

struct Scene {
    static let DEBUG = true
    var objects : [SceneObject]
    
    init(){
        if Scene.DEBUG { print("Creating Scene") }
        objects = [SceneObject]()
        if Scene.DEBUG { print("Scene Created Successfull") }
    }
    
    mutating func addObject(_ obj: SceneObject) -> Bool {
        if(objects.contains(where: { sceneObj in sceneObj.id == obj.id })){
            return false
        } else {
            objects.append(obj);
            return true
        }
    }
    
    func getObject(_ entityID: String) -> SceneObject? {
        return objects.first { obj in
            obj.id == entityID
        }
    }
    
    mutating func removeObject(entityID: String){
        objects.removeAll { obj in
            obj.id == entityID
        }
    }
    
    func contains(entityID : String) -> Bool{
        return objects.contains { obj in
            obj.id == entityID
        }
    }
    
    
    
}
