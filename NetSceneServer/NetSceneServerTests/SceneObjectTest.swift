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
        let obj = SceneObject(objectType: "testObject")
        XCTAssertTrue(obj.getData().position.x == 0 && obj.getData().position.y == 0 && obj.getData().position.z == 0)
        XCTAssertTrue(obj.getData().rotation.x == 0 && obj.getData().rotation.y == 0 && obj.getData().rotation.z == 0)
        XCTAssertTrue(obj.getData().objectType == "testObject")
    }
    
    func testSceneObjectInitWithValues() throws {
        let pos = Vec3(1,2,3)
        let rot = Vec3(3,2,1)
        
        let obj = SceneObject(objectType: "testObject",position: pos, rotation: rot)
        XCTAssertTrue(obj.getData().position == pos)
        XCTAssertTrue(obj.getData().rotation == rot)
        XCTAssertFalse(obj.getData().position == rot)
        XCTAssertFalse(obj.getData().rotation == pos)
        XCTAssertTrue(obj.getData().objectType == "testObject")
    }

    func testSceneObjectTagAdding() throws {
        var obj = SceneObject(objectType: "testObject")
        _ = obj.addTag("a")
        _ = obj.addTag("b")
        _ = obj.addTag("tag1")
        
        XCTAssertTrue(obj.getData().tags.contains("a"))
        XCTAssertTrue(obj.getData().tags.contains("b"))
        XCTAssertTrue(obj.getData().tags.contains("tag1"))
        XCTAssertFalse(obj.getData().tags.contains("123"))
        XCTAssertFalse(obj.getData().tags.contains("4562"))
    }
    
    func testSceneObjectTagAddingDuplicate() throws {
        var obj = SceneObject(objectType: "testObject")
        _ = obj.addTag("a")
        _ = obj.addTag("b")
        _ = obj.addTag("tag1")
        
        XCTAssertFalse(obj.addTag("a"))
        XCTAssertFalse(obj.addTag("b"))
        XCTAssertFalse(obj.addTag("tag1"))
        XCTAssertTrue(obj.getData().tags.contains("a"))
        XCTAssertTrue(obj.getData().tags.contains("b"))
        XCTAssertTrue(obj.getData().tags.contains("tag1"))
        XCTAssertFalse(obj.getData().tags.contains("123"))
        XCTAssertFalse(obj.getData().tags.contains("4562"))
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
