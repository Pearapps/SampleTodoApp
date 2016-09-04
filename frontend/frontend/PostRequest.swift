//
//  PostRequest.swift
//  frontend
//
//  Created by Kenneth Parker Ackerson on 9/4/16.
//  Copyright © 2016 Kenneth Ackerson. All rights reserved.
//

import Foundation

/// Very very simple request struct to allow us to post JSON to an HTTP server.
struct PostJSONRequest {
    let session: Session
    let JSONBody: JSON
    let URL: NSURL
    
    func task() -> DataTask {
        let request = NSMutableURLRequest(URL: URL)
        request.HTTPBody = JSONBody.toData()
        request.HTTPMethod = "POST"
        print(JSONBody.toJSON())
        return session.dataTaskWithURLRequest(request, completionHandler: { (data, response, error) in
            
        })
    }
}
