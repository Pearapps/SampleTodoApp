//
//  TodoConverterTests.swift
//  frontend
//
//  Created by Kenneth Parker Ackerson on 9/3/16.
//  Copyright © 2016 Kenneth Ackerson. All rights reserved.
//

import XCTest
@testable import frontend

final class TodoConverterTests: XCTestCase {

    func testValidTodoObjectConversion() {
        
        let converted = TodoConverter().convert([["todo_id" : 3, "todo_title" : "title"]])
        
        XCTAssert(converted.count == 1, "ONLY one todo model should be found")
        
        guard let todo = converted.first else {
            XCTFail("first should return a concrete model")
            return
        }
        
        XCTAssert(todo.id == 3)
        XCTAssert(todo.title == "title")
    }
    
    func testOneValidTodoObjectAndOneInvalidConversion() {
        
        let converted = TodoConverter().convert([["todo_id" : 3, "todo_title" : "title"], ["idk" :"not valid"]])
        
        XCTAssert(converted.count == 1, "ONLY one todo model should be found")
        
        guard let todo = converted.first else {
            XCTFail("first should return a concrete model")
            return
        }
        
        XCTAssert(todo.id == 3)
        XCTAssert(todo.title == "title")
    }
    
    func testValidIDAndInvalidTitleFieldTodoObjectConversion() {
        
        let converted = TodoConverter().convert([["todo_id" : 3, "NOT VALID" : "title"]])
        
        XCTAssert(converted.count == 0, "No todo models should be found")
    }
    
    func testFullyInvalidTodoObjectConversion() {
        
        let converted = TodoConverter().convert([["nope" : "", "NOT VALID" : "no"]])
        
        XCTAssert(converted.count == 0, "No todo models should be found")
    }
    
    func testValidTitleAndInvalidIDFieldTodoObjectConversion() {
        
        let converted = TodoConverter().convert([["NO" : 3, "todo_title" : "title"]])
        
        XCTAssert(converted.count == 0, "No todo models should be found")
    }

    func testMultipleValidTodoObjectConversion() {
        
        let converted = TodoConverter().convert([["todo_id" : 3, "todo_title" : "title"], ["todo_id" : 2, "todo_title" : "the title you know"]])
        
        XCTAssert(converted.count == 2, "ONLY two todo models should be found")
        
        XCTAssert(converted[0].id == 3)
        XCTAssert(converted[0].title == "title")
        
        XCTAssert(converted[1].id == 2)
        XCTAssert(converted[1].title == "the title you know")
    }
    
}
