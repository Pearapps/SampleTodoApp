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
