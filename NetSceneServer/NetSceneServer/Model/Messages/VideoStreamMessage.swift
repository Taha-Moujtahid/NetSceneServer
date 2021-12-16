//
//  VideoStreamMessage.swift
//  NetSceneServer
//
//  Created by Taha Moujtahid on 16.12.21.
//

import Foundation

struct VideoStreamMessage : Codable, NetMessage {
    static var messageType = "VideoStreamMessage"
    
    var frame : Data
}

extension NetSceneServerMessageHandler {
    func handleMessage( _ message : VideoStreamMessage?){
        if let message = message {
            print("VideoStreamMessage: frame: \(message.frame)")
        }else{
            print("VideoStreamMessage with insufficient data")
        }
    }
}
