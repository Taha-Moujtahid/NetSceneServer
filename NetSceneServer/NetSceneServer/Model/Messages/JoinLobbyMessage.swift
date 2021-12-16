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

struct JoinLobbyResponse : Codable , NetMessage{
    static var messageType = "JoinLobbyResponse"
    var success : Bool
}

extension NetSceneServerMessageHandler {
    func handleMessage(client: NetSceneClient, _ message : JoinLobbyMessage?){
        if let message = message {
            LobbyHandler.shared.joinLobby(client: client, lobbyID: message.lobbyID)
        }else{
            print("Join Message with insufficient data")
        }
    }
}
