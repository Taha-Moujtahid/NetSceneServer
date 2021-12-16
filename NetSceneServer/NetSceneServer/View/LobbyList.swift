//
//  LobbyList.swift
//  NetSceneServer
//
//  Created by Taha Moujtahid on 01.12.21.
//

import SwiftUI

struct LobbyList: View {
    @ObservedObject var lobbyHandler = LobbyHandler.shared
    var onSelect : (Lobby)->()
    var body: some View {
        VStack{
            Text("Lobbies:").font(Font.headline)
            List(lobbyHandler.lobbies){ lobby in
                Text(lobby.name ?? lobby.id)
                .onTapGesture {
                    onSelect(lobby)
                }
            }
            Button {
                LobbyHandler.shared.createLobby()
            } label: {
                Text("Add Lobby")
            }
        }
    }
}

struct LobbyList_Previews: PreviewProvider {
    static var previews: some View {
        LobbyList { Lobby in }
    }
}
