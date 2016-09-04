//
//  DataTask.swift
//  frontend
//
//  Created by Kenneth Parker Ackerson on 9/3/16.
//  Copyright © 2016 Kenneth Ackerson. All rights reserved.
//

import Foundation

protocol DataTask {
    func resume()
    func currentURLRequest() -> NSURLRequest?
}
