//
//  NetSceneServerTests.swift
//  NetSceneServerTests
//
//  Created by Taha Moujtahid on 01.12.21.
//

import XCTest

class NetSceneServerTests: XCTestCase {

    override func setUp() {
        print("SETUP TEST")
    }
    
    override func tearDown() {
        NetSceneServer.listener?.cancel()
        print("TEARDOWN")
    }
    
    override func setUpWithError() throws {
        
    }

    override func tearDownWithError() throws {
        
    }

    func testServerStartAndStop() throws {
        
        let expectation = XCTestExpectation(description: "Starting up the server")
        
        NetSceneServer.startServer()
        
        if(NetSceneServer.listener!.state == .ready){
            expectation.fulfill()
        }
        
        NetSceneServer.listener!.stateUpdateHandler = { state in
            switch(state){
                case .ready:
                    expectation.fulfill()
                default :
                    print(state)
            }
        }
        
        wait(for: [expectation], timeout: 10)
    }
    
    func testServerDoesNotStartTwice() throws {
        
        NetSceneServer.startServer()
        
        if(NetSceneServer.listener!.state == .ready){
            XCTAssertThrowsError(NetSceneServer())
        }
        
        NetSceneServer.listener!.stateUpdateHandler = { state in
            switch(state){
                case .ready:
                    XCTAssertThrowsError(NetSceneServer(), "not creating duplicate servers")
                    print("ready")
                default :
                    print(state)
            }
        }
        
    }
    
    func testServerReachble() throws{
        NetSceneServer.startServer()
        let expectation = XCTestExpectation(description: "Server listening to connections test")
        
        let client = NetSceneClient(connection: LocalNetSceneConnection)
        let queue = DispatchQueue(label: "LocalClientQueue")
        
        client.setOnReceive { data in
            print(String(data: data, encoding: .ascii)!)
        }
        
        client.connection.start(queue: queue)
        
        print("waiting for server to be ready")
        while(NetSceneServer.listener!.state != .ready){ }
        
        print("waiting for client to be ready")
        while(client.connection.state != .ready){  }
        
        print("server.state: \(NetSceneServer.listener!.state)")
        print("client.state: \(client.connection.state)")
        
        client.send("test".data(using: .ascii)!){
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 10)
    }

}
