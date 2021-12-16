//
//  VideoStreamMessage.swift
//  NetSceneServer
//
//  Created by Taha Moujtahid on 16.12.21.
//

import Foundation

struct VideoStreamMessage : Codable, NetMessage {
    static var messageType = "VideoStreamMessage"
    
    var frame : String // NEEDS TO BE BASE64 ENCODED!
}

extension NetSceneServerMessageHandler {
    func handleMessage( client: NetSceneClient, _ message : VideoStreamMessage?){
        if message != nil {
            client.broadcast(try! JSONEncoder().encode(message))
        }else{
            print("VideoStreamMessage with insufficient data")
        }
    }
}
