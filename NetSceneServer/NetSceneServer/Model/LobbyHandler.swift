//
//  LobbyHandler.swift
//  NetSceneServer
//
//  Created by Taha Moujtahid on 15.12.21.
//

import Foundation

class LobbyHandler : ObservableObject {
    static var shared = LobbyHandler()
    
    @Published var lobbies = [Lobby]()
    
    func createLobby(){
        lobbies.append(Lobby())
    }
}
