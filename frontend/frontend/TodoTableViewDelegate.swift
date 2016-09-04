//
//  TodoTableViewDelegate.swift
//  frontend
//
//  Created by Kenneth Parker Ackerson on 8/30/16.
//  Copyright © 2016 Kenneth Ackerson. All rights reserved.
//

import UIKit

final class TodoTableViewDelegate<T: DataSet where T.Model == Todo>: NSObject, UITableViewDelegate {
    
    private let dataSet: T
    
    init(dataSet: T) {
        self.dataSet = dataSet
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        let maxSize = CGSize(width: tableView.bounds.size.width, height: CGFloat.max)
        
        return dataSet.data()[indexPath.row].title.boundingRectWithSize(maxSize,
                                                                       options: NSStringDrawingOptions.UsesLineFragmentOrigin,
                                                                       attributes: [NSFontAttributeName: UIFont.systemFontOfSize(20)],
                                                                       context: nil).height + 30
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.cellForRowAtIndexPath(indexPath)?.setSelected(false, animated: false)
    }
}
