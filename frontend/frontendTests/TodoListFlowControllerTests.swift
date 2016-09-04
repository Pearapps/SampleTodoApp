//
//  TodoListFlowControllerTests.swift
//  frontend
//
//  Created by Kenneth Parker Ackerson on 9/3/16.
//  Copyright © 2016 Kenneth Ackerson. All rights reserved.
//

import FBSnapshotTestCase
@testable import frontend

final class TodoListFlowControllerTests: FBSnapshotTestCase {
    
    override func setUp() {
        super.setUp()
        recordMode = false
    }
    
    private struct TestDataTask: DataTask {
        func resume() { }
    }
    
    private struct TestSession: Session {
        
        private let JSON: String
        
        init(JSON: String) {
            self.JSON = JSON
        }
        
        func dataTaskWithURL(url: NSURL, completionHandler: (NSData?, NSURLResponse?, NSError?) -> Void) -> DataTask {
            
            let data =  JSON.dataUsingEncoding(NSUTF8StringEncoding)
            
            completionHandler(data, nil, nil)
            
            return TestDataTask()
        }
    }
    
    private struct TestDispatcher: CompletionHandlerDispatcher {
        func dispatch(f: () -> ()) { f() }
    }
    
    func testFlowControllerLooksFine() {
        
        let JSONs = ["[{\"todo_title\":\"Pick up groceries\",\"todo_id\":1},{\"todo_title\":\"Take out the dog\",\"todo_id\":2}]",
                     "[{\"todo_title\":\"do other things that are cool alot yo yo yo\",\"todo_id\":1},{\"todo_title\":\"do a bunch of stuff do a bunch of stuff  do a bunch of stuff  do a bunch of stuff  do a bunch of stuff  \",\"todo_id\":2}]"]
        
        let sizes = [CGSize(width: 320, height: 480),
                     CGSize(width: 320, height: 568),
                     CGSize(width: 375, height: 667),
                     CGSize(width: 414, height: 736)]
        
        for JSON in JSONs {
            for size in sizes {
                let navigation = UINavigationController()
                
                let testSession = TestSession(JSON: JSON)
                
                let tableView = UITableView()
                
                tableView.frame = CGRect(x: 0, y: 0, width: size.width, height: size.height)
                
                let flowController = TodoListFlowController(fetcher:
                    BackendFetcher(session: testSession,
                        URL: NSURL(),
                        converter: TodoConverter(),
                        dispatcher: TestDispatcher()),
                                                            navigationController: navigation,
                                                            tableView: tableView,
                                                            URLSession: testSession)
                
                flowController.start(false)
                
                flowController.refresh()
                
                FBSnapshotVerifyView(tableView, identifier: "\(JSON.characters.count)\(size)")
            }
        }
        
    }
    
    
}
