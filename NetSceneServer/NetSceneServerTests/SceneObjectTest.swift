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
        XCTAssertTrue(obj.data.position.x == 0 && obj.data.position.y == 0 && obj.data.position.z == 0)
        XCTAssertTrue(obj.data.rotation.x == 0 && obj.data.rotation.y == 0 && obj.data.rotation.z == 0)
        XCTAssertTrue(obj.data.objectID == "testObject")
    }
    
    func testSceneObjectInitWithValues() throws {
        let pos = Vec3(1,2,3)
        let rot = Vec3(3,2,1)
        
        let obj = SceneObject(objectID: "testObject",position: pos, rotation: rot)
        XCTAssertTrue(obj.data.position == pos)
        XCTAssertTrue(obj.data.rotation == rot)
        XCTAssertFalse(obj.data.position == rot)
        XCTAssertFalse(obj.data.rotation == pos)
        XCTAssertTrue(obj.data.objectID == "testObject")
    }

    func testSceneObjectTagAdding() throws {
        var obj = SceneObject(objectID: "testObject")
        _ = obj.addTag("a")
        _ = obj.addTag("b")
        _ = obj.addTag("tag1")
        
        XCTAssertTrue(obj.data.tags.contains("a"))
        XCTAssertTrue(obj.data.tags.contains("b"))
        XCTAssertTrue(obj.data.tags.contains("tag1"))
        XCTAssertFalse(obj.data.tags.contains("123"))
        XCTAssertFalse(obj.data.tags.contains("4562"))
    }
    
    func testSceneObjectTagAddingDuplicate() throws {
        var obj = SceneObject(objectID: "testObject")
        _ = obj.addTag("a")
        _ = obj.addTag("b")
        _ = obj.addTag("tag1")
        
        XCTAssertFalse(obj.addTag("a"))
        XCTAssertFalse(obj.addTag("b"))
        XCTAssertFalse(obj.addTag("tag1"))
        XCTAssertTrue(obj.data.tags.contains("a"))
        XCTAssertTrue(obj.data.tags.contains("b"))
        XCTAssertTrue(obj.data.tags.contains("tag1"))
        XCTAssertFalse(obj.data.tags.contains("123"))
        XCTAssertFalse(obj.data.tags.contains("4562"))
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
