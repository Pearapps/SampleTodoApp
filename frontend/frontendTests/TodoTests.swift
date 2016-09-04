//
//  TodoTests.swift
//  frontend
//
//  Created by Kenneth Parker Ackerson on 9/3/16.
//  Copyright © 2016 Kenneth Ackerson. All rights reserved.
//

import XCTest
@testable import frontend

final class TodoTests: XCTestCase {

    func testHashValueIsCorrectWithEmptyTitle() {
        let firstTodo = Todo(id: 1, title: "")
        
        XCTAssert(firstTodo.hashValue == 1, "1 is the correct hash value with an empty title (0 characters)")
    }
    
    func testHashValueIsCorrectWithLongTitle() {
        let firstTodo = Todo(id: 4, title: "dkdaole kdje as d f")
        
        XCTAssert(firstTodo.hashValue == 23, "23 is the correct hashvalue for this todo")
    }
    
    func testTodoEqualityWithTwoEmptyTitleTodos() {
        let firstTodo = Todo(id: 1, title: "")

        let secondTodo = Todo(id: 1, title: "")
        
        XCTAssert(firstTodo == secondTodo, "Same id and title should be equal")
    }
    
    func testTodoEqualityWithOneEmptyTitleTodos() {
        let firstTodo = Todo(id: 1, title: "")
        
        XCTAssert(firstTodo == firstTodo, "Comparing a todo to itself should always be equal")
    }
    
    func testTodoEqualityWithOneEmptyTitleTodoAndOneWithADifferentTitleButSameId() {
        let firstTodo = Todo(id: 1, title: "")
        
        let secondTodo = Todo(id: 1, title: "Other")
        
        XCTAssert(firstTodo != secondTodo, "Same id but different title should not be equal")
    }
    
    func testTodoEqualityWithOneEmptyTitleTodoAndOneWithADifferentIdButSameTitle() {
        let firstTodo = Todo(id: 1, title: "")
        
        let secondTodo = Todo(id: 3, title: "")
        
        XCTAssert(firstTodo != secondTodo, "Same title but different id should not be equal")
    }
    
    func testTodoEqualityWithTwoDifferentTodos() {
        let firstTodo = Todo(id: 10, title: "")
        
        let secondTodo = Todo(id: 3, title: "hello")
        
        XCTAssert(firstTodo != secondTodo, "Different id and title should not be equal")
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }

}
