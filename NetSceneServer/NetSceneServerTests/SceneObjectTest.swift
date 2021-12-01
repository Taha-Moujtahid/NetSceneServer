//
//  SceneObjectTest.swift
//  NetSceneServerTests
//
//  Created by Taha Moujtahid on 01.12.21.
//

import XCTest

class SceneObjectTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testSceneObjectInitWithoutValues() throws {
        let obj = SceneObject(objectID: "testObject")
        XCTAssertTrue(obj.position.x == 0 && obj.position.y == 0 && obj.position.z == 0)
        XCTAssertTrue(obj.rotation.x == 0 && obj.rotation.y == 0 && obj.rotation.z == 0)
        XCTAssertTrue(obj.objectID == "testObject")
    }
    
    func testSceneObjectInitWithValues() throws {
        let pos = Vec3(x: 1,y: 2,z: 3)
        let rot = Vec3(x: 3,y: 2,z: 1)
        
        let obj = SceneObject(objectID: "testObject",position: pos, rotation: rot)
        XCTAssertTrue(obj.position == pos)
        XCTAssertTrue(obj.rotation == rot)
        XCTAssertFalse(obj.position == rot)
        XCTAssertFalse(obj.rotation == pos)
        XCTAssertTrue(obj.objectID == "testObject")
    }

    func testSceneObjectTagAdding() throws {
        var obj = SceneObject(objectID: "testObject")
        _ = obj.addTag("a")
        _ = obj.addTag("b")
        _ = obj.addTag("tag1")
        
        XCTAssertTrue(obj.tags.contains("a"))
        XCTAssertTrue(obj.tags.contains("b"))
        XCTAssertTrue(obj.tags.contains("tag1"))
        XCTAssertFalse(obj.tags.contains("123"))
        XCTAssertFalse(obj.tags.contains("4562"))
    }
    
    func testSceneObjectTagAddingDuplicate() throws {
        var obj = SceneObject(objectID: "testObject")
        _ = obj.addTag("a")
        _ = obj.addTag("b")
        _ = obj.addTag("tag1")
        
        XCTAssertFalse(obj.addTag("a"))
        XCTAssertFalse(obj.addTag("b"))
        XCTAssertFalse(obj.addTag("tag1"))
        XCTAssertTrue(obj.tags.contains("a"))
        XCTAssertTrue(obj.tags.contains("b"))
        XCTAssertTrue(obj.tags.contains("tag1"))
        XCTAssertFalse(obj.tags.contains("123"))
        XCTAssertFalse(obj.tags.contains("4562"))
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
