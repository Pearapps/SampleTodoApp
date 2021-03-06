//
//  NSURLSession+Session.swift
//  frontend
//
//  Created by Kenneth Parker Ackerson on 9/3/16.
//  Copyright © 2016 Kenneth Ackerson. All rights reserved.
//

import Foundation

extension NSURLSession: Session {
    func dataTaskWithURL(url: NSURL, completionHandler: (NSData?, NSURLResponse?, NSError?) -> Void) -> DataTask {
        return dataTaskWithURL(url, completionHandler: completionHandler) as NSURLSessionDataTask
    }
    
    func dataTaskWithURLRequest(request: NSURLRequest, completionHandler: (NSData?, NSURLResponse?, NSError?) -> Void) -> DataTask {
        return dataTaskWithRequest(request, completionHandler: completionHandler)
    }
}
