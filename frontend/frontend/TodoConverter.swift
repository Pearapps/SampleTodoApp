//
//  TodoConverter.swift
//  frontend
//
//  Created by Kenneth Parker Ackerson on 9/3/16.
//  Copyright © 2016 Kenneth Ackerson. All rights reserved.
//

import Foundation

struct TodoConverter: Converter {
    
    func convert(JSONArray: [[String : AnyObject]]) -> [Todo] {
        return JSONArray.flatMap { dictionary -> Todo? in
            if let id = dictionary["todo_id"] as? Int,
                let title = dictionary["todo_title"] as? String {
                return Todo(id: id, title: title)
            }
            return nil
        }
        
    }
}
