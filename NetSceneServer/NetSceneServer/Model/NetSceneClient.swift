//
//  NetSceneClient.swift
//  NetSceneServer
//
//  Created by Taha Moujtahid on 01.12.21.
//

import Foundation

struct NetSceneClient : Identifiable{
    let id = UUID().uuidString
    
    func send(_ data : Decodable){
        print("Sending \(data)")
    }
}
