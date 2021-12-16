//
//  JoinLobbyMessage.swift
//  NetSceneServer
//
//  Created by Taha Moujtahid on 15.12.21.
//

import Foundation

struct JoinLobbyMessage : Codable , NetMessage{
    static var messageType = "JoinLobbyMessage"
    var lobbyID : String
}

extension NetSceneServerMessageHandler {
    func handleMessage(_ message : JoinLobbyMessage?){
        if let message = message {
            print("Join Message : \(message.lobbyID)")
        }else{
            print("Join Message with insufficient data")
        }
    }
}
