//
//  TodoListFlowController.swift
//  frontend
//
//  Created by Kenneth Parker Ackerson on 8/30/16.
//  Copyright © 2016 Kenneth Ackerson. All rights reserved.
//

import UIKit

/// this is where all the shitty mutable craziness lives
final class TodoListFlowController: NSObject, AddTodoFlowControllerDelegate {
    
    /// We probably actually want to pass in some protocol instead
    private let fetcher: BackendFetcher<Todo, TodoConverter>
    private let refreshController = UIRefreshControl()
    private let tableView: UITableView
    private let navigationController: UINavigationController
    private let tableViewUpdater: TodoTableViewUpdater
    private let URLSession: Session
    
    private let addTodoFlowController = AddTodoFlowController()
    
    init(fetcher: BackendFetcher<Todo, TodoConverter>,
         navigationController: UINavigationController,
         tableView: UITableView,
         URLSession: Session) {
        self.fetcher = fetcher
        self.navigationController = navigationController
        self.tableView = tableView
        self.URLSession = URLSession
        tableViewUpdater = TodoTableViewUpdater(tableView: tableView)
    }
    
    /// Using functions like this instead of using properties can keep these things immutable without getting the chicken-egg problem of using properties on self.
    func start(animated: Bool) {
        
        tableView.addSubview(refreshController)
        refreshController.addTarget(self, action: #selector(refresh), forControlEvents: .ValueChanged)
        
        let viewController = ViewController(tableView: tableView)
        
        viewController.title = "Todos"
        
        viewController.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: #selector(add))
        
        navigationController.pushViewController(viewController, animated: animated)
    }
    
    func didAddTodo(todo: Todo) {
        
        // Update local cache
        tableViewUpdater.addModel(todo)
        
        if let URL = NSURL(string: "http://localhost:3030/add_todos") {
            PostJSONRequest(session: URLSession, JSONBody: todo, URL: URL).task().resume()
        }
    }
    
    func presentViewController(viewController: UIViewController) {
        navigationController.presentViewController(viewController, animated: true, completion: nil)
    }
    
    func add() {
        addTodoFlowController.add(self)
    }
    
    func refresh() {
        
        /// We are using `self` so we will retain ourselves until the fetch is over.
        fetcher.fetch { (models) in
            self.tableViewUpdater.setModels(models)
            self.refreshController.endRefreshing()
        }
    }
    
}


