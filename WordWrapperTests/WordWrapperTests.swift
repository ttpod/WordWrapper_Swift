//
//  WordWrapperTests.swift
//  WordWrapperTests
//
//  Created by lihui on 14/11/4.
//  Copyright (c) 2014年 lihui. All rights reserved.
//

import Cocoa
import XCTest

class WordWrapperTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testOneWordLEColumnNumberShouldNoWrap() {
        XCTAssertEqual("word", WordWrapper.wrap("word", 5), "")
    }
    
    func testOneWordGTColumnNumberShouldWrap() {
        XCTAssertEqual("wo\nrd", WordWrapper.wrap("word", 2), "")
    }
    
    func testOneWordGTColumnNumberShouldWrapTwice() {
        XCTAssertEqual("word\nword\nword", WordWrapper.wrap("wordwordword", 4), "")
    }
    
    func testOneWordGTColumnNumberShouldWrapThird() {
        XCTAssertEqual("word\nword\nword\nword", WordWrapper.wrap("wordwordwordword", 4), "")
    }
    
    func testTwoWordColumnNumberShouldWrap() {
        XCTAssertEqual("word\nword", WordWrapper.wrap("word word", 4), "")
    }
    
    func testTwoWordGTColumnNumberShouldWrap() {
        XCTAssertEqual("word\nword", WordWrapper.wrap("word word", 6), "")
    }
    
    func testThreeWordLTColumnNumberShouldNotWrap() {
        XCTAssertEqual("word word\nword", WordWrapper.wrap("word word word", 10), "")
    }
    
    func testThreeWordLEColumnNumberShouldNotWrap() {
        XCTAssertEqual("word word\nword", WordWrapper.wrap("word word word", 9), "")
    }
    
    func testThreeWordLEExtentColumnNumberShouldNotWrap() {
        XCTAssertEqual("word word\nword word", WordWrapper.wrap("word word word word", 9), "")
    }
}
