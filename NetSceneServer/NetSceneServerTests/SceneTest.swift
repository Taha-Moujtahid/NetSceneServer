//
//  SceneTest.swift
//  NetSceneServerTests
//
//  Created by Taha Moujtahid on 01.12.21.
//

import XCTest

class SceneTest: XCTestCase {

    
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testSceneAddAndContains() throws {
        var scene = Scene()
        let sceneObject = SceneObject(objectID: "testObject");
        
        XCTAssertTrue(scene.addObject(sceneObject))
        XCTAssertTrue(scene.contains(objectID: "testObject"))
    }
    
    func testSceneAddDuplicate() throws {
        var scene = Scene()
        let sceneObject = SceneObject(objectID: "testObject");
        
        XCTAssertTrue(scene.addObject(sceneObject))
        XCTAssertFalse(scene.addObject(sceneObject))
        XCTAssertTrue(scene.contains(objectID: "testObject"))
    }
    
    func testSceneRemove() throws {
        var scene = Scene()
        let sceneObject = SceneObject(objectID: "testObject")
        XCTAssertTrue(scene.addObject(sceneObject))
        XCTAssertTrue(scene.contains(objectID: "testObject"))
        scene.removeObject(objectID: "abcd")
        scene.removeObject(objectID: "123")
        scene.removeObject(objectID: "456")
        XCTAssertTrue(scene.contains(objectID: "testObject"))
        scene.removeObject(objectID: "testObject")
        XCTAssertFalse(scene.contains(objectID: "testObject"))
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
