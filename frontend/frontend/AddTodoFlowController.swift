//
//  AddTodoFlowController.swift
//  frontend
//
//  Created by Kenneth Parker Ackerson on 8/30/16.
//  Copyright © 2016 Kenneth Ackerson. All rights reserved.
//

import UIKit

protocol AddTodoFlowControllerDelegate: class {
    func didAddTodo(todo: Todo)
    
    func presentViewController(viewController: UIViewController)
}

final class AddTodoFlowController {
    
    private let textField = UITextField()
    
    func add(delegate: AddTodoFlowControllerDelegate) {
        
        let alert = UIAlertController(title: "Add Todo", message: "Add something you need to do!", preferredStyle: .Alert)
        alert.addTextFieldWithConfigurationHandler { (textField) in
            textField.placeholder = "Todo name"
        }
        
        let add = UIAlertAction(title: "Add", style: .Default) { (_) in
        
            if let textField = alert.textFields?.first, let text = textField.text {
                
                // 2^31 is 2147483648 - doing this so we dont overflow on conversion from UInt32 -> Int
                let todo = Todo(id: Int(arc4random_uniform(2147483648)), title: text)
                
                delegate.didAddTodo(todo)
            }
            
        }
        
        let cancel = UIAlertAction(title: "Cancel", style: .Cancel) { (_) in }
        
        alert.addAction(cancel)
        alert.addAction(add)
        delegate.presentViewController(alert)
        
    }
}
