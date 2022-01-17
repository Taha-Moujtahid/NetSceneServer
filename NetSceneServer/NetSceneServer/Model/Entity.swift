//
//  Entity.swift
//  NetSceneServer
//
//  Created by Taha Moujtahid on 12.01.22.
//

import Foundation
import CoreText


class Entity : Identifiable{
    var id = UUID().uuidString
    private var locked : Bool = false
    private var lockedBy : String?
    
    func isLocked()->Bool{
        return locked
    }
    
    func lock(by clientID: String) -> Bool{
        if(locked && !unlock(by: clientID)){
            return false
        }
        locked = true
        lockedBy = clientID
        return true
    }
    
    func unlock(by clientID: String) -> Bool{
        if(locked){
            if(clientID == lockedBy){
                locked = false
                lockedBy = nil
                return true
            }
            return false
        }
        return true
    }
}
