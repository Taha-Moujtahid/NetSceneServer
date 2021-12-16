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
    
    func joinLobby(client : NetSceneClient, lobbyID : String){
        if let lobby = lobbies.first(where: { it in it.id == lobbyID }) {
            if let data = try? JSONEncoder().encode(JoinLobbyResponse(success: lobby.addClient(client))) {
                client.send( data , onSended: nil)
            }
        }else{
            print("LobbyNotFound!")
            client.send( try! JSONEncoder().encode(JoinLobbyResponse(success: false)) , onSended: nil)
        }
        
    }
}
