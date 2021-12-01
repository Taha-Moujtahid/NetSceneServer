//
//  NetSceneServerTests.swift
//  NetSceneServerTests
//
//  Created by Taha Moujtahid on 01.12.21.
//

import XCTest

class NetSceneServerTests: XCTestCase {

    override func setUpWithError() throws {
        NetSceneServer.shared.listener?.cancel()
        NetSceneServer.shared = try! NetSceneServer()
    }

    override func tearDownWithError() throws {
        NetSceneServer.shared.listener?.cancel()
        NetSceneServer.shared = try! NetSceneServer()
    }

    func testServerStartAndStop() throws {
        
        let expectation = XCTestExpectation(description: "Starting up the server")
        
        NetSceneServer.shared.startServer()
        
        if(NetSceneServer.shared.listener!.state == .ready){
            expectation.fulfill()
        }
        
        NetSceneServer.shared.listener!.stateUpdateHandler = { state in
            switch(state){
                case .ready:
                    expectation.fulfill()
                default :
                    print(state)
            }
        }
        
        wait(for: [expectation], timeout: 10)
        NetSceneServer.shared.listener?.cancel()
    }
    
    func testServerDoesNotStartTwice() throws {
        
        NetSceneServer.shared.startServer()
        
        if(NetSceneServer.shared.listener!.state == .ready){
            XCTAssertThrowsError(try NetSceneServer())
        }
        
        NetSceneServer.shared.listener!.stateUpdateHandler = { state in
            switch(state){
                case .ready:
                    XCTAssertThrowsError(try! NetSceneServer(), "not creating duplicate servers")
                    print("ready")
                default :
                    print(state)
            }
        }
        
        NetSceneServer.shared.listener?.cancel()
    }

}
