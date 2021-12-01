//
//  ContentView.swift
//  NetSceneServer
//
//  Created by Taha Moujtahid on 01.12.21.
//

import SwiftUI

struct ContentView: View {
    @State var selectedLobby : Lobby?
    var body: some View {
        return HStack{
            LobbyList { selectedLobby in
                self.selectedLobby = selectedLobby
            }
            ClientList(lobby: selectedLobby)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
