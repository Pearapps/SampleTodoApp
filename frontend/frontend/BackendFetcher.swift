//
//  BackendFetcher.swift
//  frontend
//
//  Created by Kenneth Parker Ackerson on 8/30/16.
//  Copyright © 2016 Kenneth Ackerson. All rights reserved.
//

import Foundation

final class BackendFetcher<T, U: Converter where U.Model == T> {
    
    private let session: Session
    private let URL: NSURL
    private let converter: U
    private let dispatcher: CompletionHandlerDispatcher
    
    init(session: Session, URL: NSURL, converter: U, dispatcher: CompletionHandlerDispatcher) {
        self.session = session
        self.URL = URL
        self.converter = converter
        self.dispatcher = dispatcher
    }
    
    func fetch(completion: [T] -> (), failure: () -> ()) {
        
        let task = session.dataTaskWithURL(URL) {
            if let JSON = ($0.0.flatMap { try? NSJSONSerialization.JSONObjectWithData($0, options: .AllowFragments) }) as? [[String: AnyObject]] {
                self.dispatcher.dispatch {
                    completion(self.converter.convert(JSON))
                }
            }
            else {
                self.dispatcher.dispatch(failure)
            }
        }
        
        task.resume()
        
    }
}
