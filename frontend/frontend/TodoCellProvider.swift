//
//  TodoCellProvider.swift
//  frontend
//
//  Created by Kenneth Parker Ackerson on 8/30/16.
//  Copyright © 2016 Kenneth Ackerson. All rights reserved.
//

import UIKit

final class TodoCellProvider: CellProvider {
    func cell(forModel model: Todo) -> UITableViewCell {
        
        /// We _could_ reuse cells here, but this use case here is surely not worth the additional complexity/potentiall reuse issues.
        let cell = UITableViewCell()
        
        cell.textLabel?.text = model.title
        cell.textLabel?.numberOfLines = 0
        
        return cell
    }
}
