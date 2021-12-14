//
//  Scene.swift
//  NetSceneServer
//
//  Created by Taha Moujtahid on 01.12.21.
//

import Foundation

struct Scene {
    static let DEBUG = true
    //jenkins test
    var objects : [SceneObject]
    
    init(){
        if Scene.DEBUG { print("Creating Scene") }
        objects = [SceneObject]()
        if Scene.DEBUG { print("Scene Created Successfull") }
    }
    
    mutating func addObject(_ obj: SceneObject) -> Bool {
        if(objects.contains(where: { sceneObj in sceneObj.objectID == obj.objectID })){
            return false
        } else {
            objects.append(obj);
            return true
        }
    }
    
    mutating func removeObject(objectID: String){
        objects.removeAll { obj in
            obj.objectID == objectID
        }
    }
    
    func contains(objectID : String) -> Bool{
        return objects.contains { obj in
            obj.objectID == objectID
        }
    }
    
    
    
}
