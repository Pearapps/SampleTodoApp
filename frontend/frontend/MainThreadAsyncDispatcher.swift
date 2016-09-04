//
//  MainThreadAsyncDispatcher.swift
//  frontend
//
//  Created by Kenneth Parker Ackerson on 9/3/16.
//  Copyright © 2016 Kenneth Ackerson. All rights reserved.
//

import Foundation

struct MainThreadAsyncDispatcher: CompletionHandlerDispatcher {
    func dispatch(f: () -> ()) {
        dispatch_async(dispatch_get_main_queue(), f)
    }
}
