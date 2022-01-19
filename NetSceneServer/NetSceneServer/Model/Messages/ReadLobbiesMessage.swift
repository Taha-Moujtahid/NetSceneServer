//
//  ReadLobbiesMessage.swift
//  NetSceneServer
//
//  Created by Taha Moujtahid on 13.01.22.
//

import Foundation

struct ReadLobbiesMessage : Codable, NetMessage {
    static var messageType = "ReadLobbiesMessage"
    var messageType = "ReadLobbiesMessage"
}

struct ReadLobbiesResponse : Codable, NetMessage {
    static var messageType = "ReadLobbiesResponse"
    var messageType = "ReadLobbiesResponse"
    var lobbies : [String]
}

extension NetSceneServerMessageHandler {
    func handleMessage(client: NetSceneClient, _ message : ReadLobbiesMessage?){
        let response = ReadLobbiesResponse(lobbies: LobbyHandler.shared.lobbies.map({ lobby in
            lobby.id
        }))
        client.send(try! JSONEncoder().encode(response) , onSended: nil)
    }
}
