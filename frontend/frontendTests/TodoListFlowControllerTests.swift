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
                
                let window = UIWindow(frame: CGRect(x: 0, y: 0, width: size.width, height: size.height))

                let navigation = UINavigationController()
                
                let testSession = TestSession(JSON: JSON)
                
                let tableView = UITableView()
                
                window.rootViewController = navigation
                window.makeKeyAndVisible()
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
                
                FBSnapshotVerifyView(window, identifier: "\(JSON.characters.count)\(size)")
            }
        }
        
    }
    
    /// Test that an additional refresh call doesnt mess the UI up.
    func testFlowControllerSingleRefreshLooksFine() {
        
        let JSON =
        "[{\"todo_title\":\"do other things that are cool alot yo yo yo\",\"todo_id\":1},{\"todo_title\":\"do a bunch of stuff do a bunch of stuff  do a bunch of stuff  do a bunch of stuff  do a bunch of stuff  \",\"todo_id\":2}]"
        
        let window = UIWindow(frame: CGRect(x: 0, y: 0, width: 320, height: 480))
        let navigation = UINavigationController()
        
        let testSession = TestSession(JSON: JSON)
        
        let tableView = UITableView()
        
        window.rootViewController = navigation
        window.makeKeyAndVisible()
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
        flowController.refresh()
        
        FBSnapshotVerifyView(window)
        
    }

    
    func testFlowControllerAddTodoActuallyUpdatedTableView() {
        
        let JSON =
        "[{\"todo_title\":\"do other things that are cool alot yo yo yo\",\"todo_id\":1},{\"todo_title\":\"do a bunch of stuff do a bunch of stuff  do a bunch of stuff  do a bunch of stuff  do a bunch of stuff  \",\"todo_id\":2}]"
        
        let window = UIWindow(frame: CGRect(x: 0, y: 0, width: 320, height: 480))
        let navigation = UINavigationController()
        
        let testSession = TestSession(JSON: JSON)
        
        let tableView = UITableView()
        
        window.rootViewController = navigation
        window.makeKeyAndVisible()
        let flowController = TodoListFlowController(fetcher:
            BackendFetcher(session: testSession,
                URL: NSURL(),
                converter: TodoConverter(),
                dispatcher: TestDispatcher()),
                                                    navigationController: navigation,
                                                    tableView: tableView,
                                                    URLSession: testSession)
        
        flowController.start(false)
        
        flowController.didAddTodo(Todo(id: 2, title: "another one!"))
        
        FBSnapshotVerifyView(window)
        
    }
    
    
}
