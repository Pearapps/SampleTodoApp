//
//  JSON.swift
//  frontend
//
//  Created by Kenneth Parker Ackerson on 9/4/16.
//  Copyright © 2016 Kenneth Ackerson. All rights reserved.
//

import Foundation

protocol JSON {
    func toJSON() -> String
}

extension JSON {
    func toData() -> NSData? {
        return self.toJSON().dataUsingEncoding(NSUTF8StringEncoding)
    }
}
