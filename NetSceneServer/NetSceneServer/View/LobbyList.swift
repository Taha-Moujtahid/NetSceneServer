//
//  LobbyList.swift
//  NetSceneServer
//
//  Created by Taha Moujtahid on 01.12.21.
//

import SwiftUI

struct LobbyList: View {
    @StateObject var sceneServer = NetSceneServer.shared
    var onSelect : (Lobby)->()
    var body: some View {
        VStack{
            Text("Lobbies:").font(Font.headline)
            List(sceneServer.lobbies){ lobby in
                Text(lobby.name ?? lobby.id)
                .onTapGesture {
                    onSelect(lobby)
                }
            }
            Button {
                NetSceneServer.shared.createLobby()
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
