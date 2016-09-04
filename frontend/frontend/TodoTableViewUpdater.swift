//
//  TodoTableViewUpdater.swift
//  frontend
//
//  Created by Kenneth Parker Ackerson on 8/31/16.
//  Copyright © 2016 Kenneth Ackerson. All rights reserved.
//

import UIKit

/// A class to handle updating and state management for updating the todo table view
final class TodoTableViewUpdater {
    private var source: TableViewDataSource<TodoDataSet, TodoCellProvider>?
    private var delegate: TodoTableViewDelegate<TodoDataSet>?
    
    private var currentDataSet: TodoDataSet?
    
    private let tableView: UITableView
    
    init(tableView: UITableView) {
        self.tableView = tableView
    }
    
    func setModels(models: [Todo]) {
        setDataSet(TodoDataSet(list: models))
    }
    
    /// Prefering setters over using `didSet` to make side effects of events easier to follow/debug
    private func setDataSet(dataSet: TodoDataSet) {
        
        /// Just to catch things if something goes awry silently
        assert(NSThread.isMainThread())
        
        self.currentDataSet = dataSet
        
        let source = TableViewDataSource(dataSet: dataSet, cellProvider: TodoCellProvider())
        let delegate = TodoTableViewDelegate(dataSet: dataSet)
        
        /// We have to hold a reference to this to prevent ARC from releasing our datasource because its a weak reference :/
        self.source = source
        self.delegate = delegate
        
        tableView.dataSource = source
        tableView.delegate = delegate
        
        tableView.reloadData()
    }
    
    func addModel(model: Todo) {
        let dataSetToCopy = currentDataSet ?? TodoDataSet(list: [])
        
        setDataSet(dataSetToCopy.copyByAddingTodo(model))
    }
}

