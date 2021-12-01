//
//  SceneObject.swift
//  NetSceneServer
//
//  Created by Taha Moujtahid on 01.12.21.
//

import Foundation

struct SceneObject : Decodable {
    
    let objectID: String
    var name: String?
    var tags = [String]()
    var position: Vec3
    var rotation: Vec3
    
    init(objectID: String){
        position = Vec3(x: 0,y: 0,z: 0)
        rotation = Vec3(x: 0,y: 0,z: 0)
        self.objectID = objectID
    }
    
    init(objectID: String, position: Vec3, rotation: Vec3){
        self.position = position
        self.rotation = rotation
        self.objectID = objectID
    }
    
    mutating func addTag(_ tag: String) -> Bool{
        if(tags.contains(tag)){
            return false
        }else{
            tags.append(tag)
            return true
        }
    }
}

struct Vec3 : Decodable , Equatable {
    var x : Float
    var y : Float
    var z : Float
}

