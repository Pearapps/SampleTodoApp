//
//  Converter.swift
//  frontend
//
//  Created by Kenneth Parker Ackerson on 9/3/16.
//  Copyright © 2016 Kenneth Ackerson. All rights reserved.
//

import Foundation

protocol Converter {
    associatedtype Model
    
    func convert(JSONArray: [[String: AnyObject]]) -> [Model]
}

