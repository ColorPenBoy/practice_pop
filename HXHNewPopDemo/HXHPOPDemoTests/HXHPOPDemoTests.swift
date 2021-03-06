//
//  HXHPOPDemoTests.swift
//  HXHPOPDemoTests
//
//  Created by 张强 on 2016/12/6.
//  Copyright © 2016年 ColorPen. All rights reserved.
//

import XCTest
@testable import HXHPOPDemo
//@testable import LocalFileClient

class HXHPOPDemoTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testUserRequest() {
        let client = LocalFileClient()
        client.send(UserRequest(name: "onevcat")) {
            user in
            XCTAssertNotNil(user)
            XCTAssertEqual(user!.name, "Wei Wang")
        }
    }
}
