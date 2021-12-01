//
//  ClientList.swift
//  NetSceneServer
//
//  Created by Taha Moujtahid on 01.12.21.
//

import SwiftUI

struct ClientList: View {
    
    var lobby : Lobby?
    
    var body: some View {
        VStack{
            if(lobby != nil){
                Text("Clients:").font(Font.headline)
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
        _ = lobby.addClient(NetSceneClient())
        _ = lobby.addClient(NetSceneClient())
        _ = lobby.addClient(NetSceneClient())
        return ClientList(lobby: lobby)
    }
}
