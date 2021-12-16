//
//  NetSceneServerMessageHandler.swift
//  NetSceneServer
//
//  Created by Taha Moujtahid on 15.12.21.
//

import Foundation

struct NetSceneServerMessageHandler {
    
    func handleData(_ data : Data){
        if let message = try? JSONSerialization.jsonObject(with: data, options: []) as? [String : Any] {
            if(message["messageType"] != nil){
                switch(message["messageType"] as! String){
                    
                case JoinLobbyMessage.messageType:
                    handleMessage( try? JSONDecoder().decode(JoinLobbyMessage.self, from: JSONSerialization.data(withJSONObject: message, options: [])) )
                    
                default:
                    handleMessage(message)
                    
                }
            }else{
                handleMessage(message)
            }
        }
    }
    
    func handleMessage(_ message : [String:Any]){
        print("WARNING Unhandeld Message : \(message)")
    }
    
}
