//
//  Todo.swift
//  frontend
//
//  Created by Kenneth Parker Ackerson on 8/30/16.
//  Copyright © 2016 Kenneth Ackerson. All rights reserved.
//

import Foundation

struct Todo {
    var id: Int
    var title: String
}

extension Todo: Hashable {
    var hashValue: Int {
        return self.id + self.title.characters.count
    }
}

func ==(lhs: Todo, rhs: Todo) -> Bool {
    return lhs.id == rhs.id && rhs.title == lhs.title
}
