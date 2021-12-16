//
//  SceneObject.swift
//  NetSceneServer
//
//  Created by Taha Moujtahid on 01.12.21.
//

import Foundation

struct SceneObject : Decodable{
    
    var data : SceneObjectData
    
    init(objectID: String){
        self.data = SceneObjectData(objectID: objectID, position: Vec3(0,0,0), rotation: Vec3(0,0,0))
    }
    
    init(objectID: String, position: Vec3, rotation: Vec3){
        self.data = SceneObjectData(objectID: objectID, position: position, rotation: rotation)
    }
    
    mutating func addTag(_ tag: String) -> Bool{
        if(data.tags.contains(tag)){
            return false
        }else{
            data.tags.append(tag)
            return true
        }
    }
}

struct Vec3 : Codable , Equatable {
    var x : Float
    var y : Float
    var z : Float
    
    init(_ x:Float, _ y: Float, _ z: Float){
        self.x = x
        self.y = y
        self.z = z
    }
}

struct SceneObjectData : Codable{
    let objectID: String
    var name: String?
    var tags = [String]()
    var position: Vec3
    var rotation: Vec3
}
