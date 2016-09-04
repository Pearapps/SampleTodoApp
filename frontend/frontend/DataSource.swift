//
//  DataSource.swift
//  frontend
//
//  Created by Kenneth Parker Ackerson on 8/30/16.
//  Copyright © 2016 Kenneth Ackerson. All rights reserved.
//

import UIKit

/// We cant just pass a collection in, because it might have to be mutated (new data/remove old data) so we expose this small wrapper for types that handle that kinda stuff.
protocol DataSet {
    associatedtype Model
    
    func data() -> [Model]
}

protocol CellProvider {
    associatedtype Model
    associatedtype Cell: UITableViewCell
    
    func cell(forModel model: Model) -> Cell
}

final class TableViewDataSource<T: DataSet, U: CellProvider where U.Model == T.Model>: NSObject, UITableViewDataSource {
    
    private let dataSet: T
    private let cellProvider: U
    
    init(dataSet: T, cellProvider: U) {
        self.dataSet = dataSet
        self.cellProvider = cellProvider
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSet.data().count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        return cellProvider.cell(forModel: dataSet.data()[indexPath.row])
    }
    
}
