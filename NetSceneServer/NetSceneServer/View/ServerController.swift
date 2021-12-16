//
//  ServerController.swift
//  NetSceneServer
//
//  Created by Taha Moujtahid on 15.12.21.
//

import SwiftUI

struct ServerController: View {
    @State var isServerOnline : Bool = (NetSceneServer.listener?.state == .ready)
    
    var body: some View {
        HStack{
            Button {
                if(isServerOnline){
                    NetSceneServer.stopServer()
                }else{
                    NetSceneServer.startServer()
                }
                isServerOnline.toggle()
            } label: {
                Text(isServerOnline ? "Stop Server" : "Start Server")
            }
            Text("Server status: ")
            Color( isServerOnline ? .green : .red)
                .frame(width: 20, height: 20)
                .cornerRadius(10)
        }.padding()
    }
}

struct ServerController_Previews: PreviewProvider {
    static var previews: some View {
        ServerController()
    }
}
