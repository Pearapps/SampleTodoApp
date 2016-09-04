//
//  TodoCellSnapshotTests.swift
//  frontend
//
//  Created by Kenneth Parker Ackerson on 9/3/16.
//  Copyright © 2016 Kenneth Ackerson. All rights reserved.
//

import FBSnapshotTestCase
@testable import frontend

final class TodoCellSnapshotTests: FBSnapshotTestCase {

    override func setUp() {
        super.setUp()
        recordMode = false
    }
    
    func testOneWordTitleCell() {
        let cell = TodoCellProvider().cell(forModel: Todo(id: 1, title: "Hello"))
        
        FBSnapshotVerifyView(cell)
    }

}
