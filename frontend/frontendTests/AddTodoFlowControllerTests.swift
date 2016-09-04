//
//  AddTodoFlowControllerTests.swift
//  
//
//  Created by Kenneth Parker Ackerson on 9/4/16.
//
//

import XCTest
@testable import frontend

final class AddTodoFlowControllerTests: XCTestCase {

    
    final class FakeDelegate: AddTodoFlowControllerDelegate {
        
        var hasCalledPresentViewController = false
        
        func didAddTodo(todo: Todo) {
            // Turns out this part is a little harder to test, coming back later - will probably need integration tests.
        }
        
        func presentViewController(viewController: UIViewController) {
            hasCalledPresentViewController = true
        }
    }
    
    func testHasCalledPresentViewController() {
        let delegate = FakeDelegate()
        
        AddTodoFlowController().add(delegate)
        
        XCTAssert(delegate.hasCalledPresentViewController)
    }
    
    

}
