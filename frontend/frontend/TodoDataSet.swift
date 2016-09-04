//
//  TodoDataSet.swift
//  frontend
//
//  Created by Kenneth Parker Ackerson on 8/30/16.
//  Copyright © 2016 Kenneth Ackerson. All rights reserved.
//

import Foundation

struct TodoDataSet: DataSet {
    
    private let list: [Todo]
    
    init(list: [Todo]) {
        self.list = list
    }
    
    func data() -> [Todo] {
        return list
    }
    
    func copyByAddingTodo(todo: Todo) -> TodoDataSet {
        return TodoDataSet(list: list + [todo])
    }
}
