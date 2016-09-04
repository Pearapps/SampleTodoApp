//
//  TodoDataSetTests.swift
//  frontend
//
//  Created by Kenneth Parker Ackerson on 9/4/16.
//  Copyright © 2016 Kenneth Ackerson. All rights reserved.
//

import XCTest
@testable import frontend

final class TodoDataSetTests: XCTestCase {

    func testDataListIsCorrect() {
        let list = [Todo.init(id: 3, title: "kenny")]
        let dataSet = TodoDataSet(list: list)
        
        XCTAssert(list == dataSet.data(), "What is in the data function should be the same as the list passed in, in the case of a todo data set")
    }
    
    func testDataListAppendsCorrectly() {
        var list = [Todo(id: 3, title: "kenny")]
        let dataSet = TodoDataSet(list: list)
        
        let anotherTodo = Todo(id: 44, title: "paul is my best friend")
        
        list.append(anotherTodo)
        
        XCTAssert(list == dataSet.copyByAddingTodo(anotherTodo).data(), "What is in the data function should be the same as the list passed in, in the case of a todo data set")
    }

}
