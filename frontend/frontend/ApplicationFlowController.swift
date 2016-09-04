//
//  ApplicationFlowController.swift
//  frontend
//
//  Created by Kenneth Parker Ackerson on 8/30/16.
//  Copyright © 2016 Kenneth Ackerson. All rights reserved.
//

import UIKit

final class ApplicationFlowController {
    
    let window = UIWindow(frame: UIScreen.mainScreen().bounds)
    private let URLSession = NSURLSession(configuration: NSURLSessionConfiguration.defaultSessionConfiguration())
    
    private var todoFlowController: TodoListFlowController?
    
    func start() {
        let navigation = UINavigationController()
        window.rootViewController = navigation

        todoFlowController = TodoListFlowController(fetcher:
            BackendFetcher(session: URLSession,
                URL: NSURL(string: "http://localhost:3030/todos") ?? NSURL(),
                converter: TodoConverter(),
                dispatcher: MainThreadAsyncDispatcher()),
                                                    navigationController: navigation,
                                                    tableView: UITableView(),
                                                    URLSession: URLSession)
        todoFlowController?.start(false)
        window.makeKeyAndVisible()
        
        todoFlowController?.refresh()
    }
        
}