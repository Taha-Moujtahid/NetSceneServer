//
//  NetSceneServerMessageHandler.swift
//  NetSceneServer
//
//  Created by Taha Moujtahid on 15.12.21.
//

import Foundation

struct NetSceneServerMessageHandler {
    
    //TODO: Make this Generic !
    func handleData(client : NetSceneClient, data : Data){
        print("message \(data)")
        if let message = try? JSONSerialization.jsonObject(with: data, options: []) as? [String : Any] {
            if(message["messageType"] != nil){
                print("client :\(client.connection.endpoint) -> \(message["messageType"]!)")
                switch(message["messageType"] as! String){
                    
                case JoinLobbyMessage.messageType:
                    handleMessage( client: client, try? JSONDecoder().decode(JoinLobbyMessage.self, from: JSONSerialization.data(withJSONObject: message, options: [])) )
                    break
                case VideoStreamMessage.messageType:
                    handleMessage( client: client, try? JSONDecoder().decode(VideoStreamMessage.self, from: JSONSerialization.data(withJSONObject: message, options: [])) )
                    break
                case CreateObjectMessage.messageType:
                    handleMessage( client: client, try? JSONDecoder().decode(CreateObjectMessage.self, from: JSONSerialization.data(withJSONObject: message, options: [])) )
                    break
                case ReadObjectsMessage.messageType:
                    handleMessage( client: client, try? JSONDecoder().decode(ReadObjectsMessage.self, from: JSONSerialization.data(withJSONObject: message, options: [])) )
                    break
                case UpdateObjectMessage.messageType:
                    handleMessage( client: client, try? JSONDecoder().decode(UpdateObjectMessage.self, from: JSONSerialization.data(withJSONObject: message, options: [])) )
                    break
                case DeleteObjectMessage.messageType:
                    handleMessage( client: client, try? JSONDecoder().decode(DeleteObjectMessage.self, from: JSONSerialization.data(withJSONObject: message, options: [])) )
                    break
                case LockEntityMessage.messageType:
                    handleMessage( client: client, try? JSONDecoder().decode(LockEntityMessage.self, from: JSONSerialization.data(withJSONObject: message, options: [])) )
                    break
                case UnlockEntityMessage.messageType:
                    handleMessage( client: client, try? JSONDecoder().decode(UnlockEntityMessage.self, from: JSONSerialization.data(withJSONObject: message, options: [])) )
                    break
                case ReadLobbiesMessage.messageType:
                    handleMessage( client: client, try? JSONDecoder().decode(ReadLobbiesMessage.self, from: JSONSerialization.data(withJSONObject: message, options: [])) )
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
