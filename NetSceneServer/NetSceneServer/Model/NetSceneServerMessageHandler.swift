//
//  NetSceneServerMessageHandler.swift
//  NetSceneServer
//
//  Created by Taha Moujtahid on 15.12.21.
//

import Foundation

struct NetSceneServerMessageHandler {
    
    func handleData(client : NetSceneClient, data : Data){
        if let message = try? JSONSerialization.jsonObject(with: data, options: []) as? [String : Any] {
            if(message["messageType"] != nil){
                switch(message["messageType"] as! String){
                    
                case JoinLobbyMessage.messageType:
                    handleMessage( client: client, try? JSONDecoder().decode(JoinLobbyMessage.self, from: JSONSerialization.data(withJSONObject: message, options: [])) )
                    break
                case VideoStreamMessage.messageType:
                    handleMessage( client: client, try? JSONDecoder().decode(VideoStreamMessage.self, from: JSONSerialization.data(withJSONObject: message, options: [])) )
                    break
                default:
                    handleMessage(client: client, message)
                    
                }
            }else{
                handleMessage(client: client, message)
            }
        }
    }
    
    func handleMessage(client: NetSceneClient, _ message : [String:Any]){
        print("WARNING Unhandeld Message : \(message) from client : \(client)")
    }
    
}
