//
//  ViewController.swift
//  frontend
//
//  Created by Kenneth Parker Ackerson on 8/30/16.
//  Copyright © 2016 Kenneth Ackerson. All rights reserved.
//

import UIKit

struct TodoViewControllerFactory {
    private let tableView: UITableView
    
    init(tableView: UITableView) {
        self.tableView = tableView
    }
    
    func viewController() -> UIViewController {
        let viewController = UIViewController()
        viewController.view.backgroundColor = .greenColor()
        viewController.view.addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.heightAnchor.constraintEqualToAnchor(viewController.view.heightAnchor, multiplier: 1.0).active = true
        tableView.widthAnchor.constraintEqualToAnchor(viewController.view.widthAnchor, multiplier: 1.0).active = true
        
        return viewController
    }
}
