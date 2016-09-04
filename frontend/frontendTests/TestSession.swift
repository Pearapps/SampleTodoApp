//
//  TestSession.swift
//  frontend
//
//  Created by Kenneth Parker Ackerson on 9/4/16.
//  Copyright © 2016 Kenneth Ackerson. All rights reserved.
//

import Foundation
@testable import frontend

struct TestDataTask: DataTask {
    func resume() { }
    func currentURLRequest() -> NSURLRequest? { return nil }
}

struct TestSession: Session {
    
    private let JSON: String
    
    init(JSON: String) {
        self.JSON = JSON
    }
    
    func dataTaskWithURL(url: NSURL, completionHandler: (NSData?, NSURLResponse?, NSError?) -> Void) -> DataTask {
        
        let data =  JSON.dataUsingEncoding(NSUTF8StringEncoding)
        
        completionHandler(data, nil, nil)
        
        return TestDataTask()
    }
    
    func dataTaskWithURLRequest(request: NSURLRequest, completionHandler: (NSData?, NSURLResponse?, NSError?) -> Void) -> DataTask {
        
        let data =  JSON.dataUsingEncoding(NSUTF8StringEncoding)
        
        completionHandler(data, nil, nil)
        
        return TestDataTask()
    }
}
