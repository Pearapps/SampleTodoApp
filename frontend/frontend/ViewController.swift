//
//  ViewController.swift
//  frontend
//
//  Created by Kenneth Parker Ackerson on 8/30/16.
//  Copyright © 2016 Kenneth Ackerson. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {

    private let tableView: UITableView
    
    init(tableView: UITableView) {
        self.tableView = tableView
        super.init(nibName: nil, bundle: nil)
    }
    
    // thanks swift
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .greenColor()
        view.addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.heightAnchor.constraintEqualToAnchor(view.heightAnchor, multiplier: 1.0).active = true
        tableView.widthAnchor.constraintEqualToAnchor(view.widthAnchor, multiplier: 1.0).active = true
    }

}

