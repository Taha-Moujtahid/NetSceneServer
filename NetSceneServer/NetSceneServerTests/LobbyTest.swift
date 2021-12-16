//
//  LobbyTest.swift
//  NetSceneServer
//
//  Created by Taha Moujtahid on 01.12.21.
//

import XCTest

class LobbyTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testAddClientToLobby() throws {
        let lobby = Lobby()
        let client = NetSceneClient(connection: LocalNetSceneConnection)
        XCTAssertTrue(lobby.addClient(client))
        XCTAssertTrue(lobby.clients.contains(where: {c in c.id == client.id}))
    }
    
    func testAddDuplicateClientToLobby() throws {
        let lobby = Lobby()
        let client = NetSceneClient(connection: LocalNetSceneConnection)
        XCTAssertTrue(lobby.addClient(client))
        XCTAssertTrue(lobby.clients.contains(where: {c in c.id == client.id}))
        XCTAssertFalse(lobby.addClient(client))
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
