//
//  ClientList.swift
//  NetSceneServer
//
//  Created by Taha Moujtahid on 01.12.21.
//

import SwiftUI
import Network

struct ClientList: View {
    
    var lobby : Lobby?
    
    var body: some View {
        VStack{
            if(lobby != nil){
                Text("Clients:").font(Font.headline).padding(12)
                List(lobby!.clients){ client in
                    Text(client.id)
                }
            }
        }
    }
}

struct ClientList_Previews: PreviewProvider {
    static var previews: some View {
        let lobby = Lobby()
        _ = lobby.addClient(NetSceneClient(connection: LocalNetSceneConnection))
        _ = lobby.addClient(NetSceneClient(connection: LocalNetSceneConnection))
        _ = lobby.addClient(NetSceneClient(connection: LocalNetSceneConnection))
        return ClientList(lobby: lobby)
    }
}
