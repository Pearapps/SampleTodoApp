//
//  PostJSONRequestTests.swift
//  frontend
//
//  Created by Kenneth Parker Ackerson on 9/4/16.
//  Copyright © 2016 Kenneth Ackerson. All rights reserved.
//

import XCTest
@testable import frontend

final class PostJSONRequestTests: XCTestCase {
    
    func testProperHTTPMethod() {
        let task = PostJSONRequest(session: NSURLSession(configuration: NSURLSessionConfiguration.defaultSessionConfiguration()), JSONBody: Todo(id: 3, title: "sdaf"), URL: NSURL()).task({ _ in })
        
        guard let request = task.currentURLRequest() else {
            XCTFail()
            return
        }
        
        XCTAssert(request.HTTPMethod == "POST", "This should always be a POST request")
    }
    
    func testProperHTTPDataIsCorrect() {
        let todo = Todo(id: 3, title: "sdaf")
        let task = PostJSONRequest(session: NSURLSession(configuration: NSURLSessionConfiguration.defaultSessionConfiguration()), JSONBody: Todo(id: 3, title: "sdaf"), URL: NSURL()).task({ _ in })
        
        guard let request = task.currentURLRequest() else {
            XCTFail()
            return
        }
        
        XCTAssert(request.HTTPBody == todo.toData(), "This should always be a POST request")
    }
    
}