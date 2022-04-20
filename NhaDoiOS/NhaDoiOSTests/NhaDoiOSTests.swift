//
//  NhaDoiOSTests.swift
//  NhaDoiOSTests
//
//  Created by Nguyễn Hoàng Văn Nhã on 3/9/22.
//

import XCTest
@testable import NhaDoiOS

class MockTodoRepository : AbstractTodoRepository {
    var todos: [Todo] = [];
    
    func getTodos() async throws -> [Todo] {
        return todos;
    }
    
    func addTodos(todos: [Todo]) async {
        self.todos.append(contentsOf: todos);
    }
}

class NhaDoiOSTests: XCTestCase {
    
    private var todoRepository: AbstractTodoRepository = MockTodoRepository();
    private var todosIds: [UUID] = [UUID(), UUID(), UUID(), ];
    
    // This is the setUp() async instance method.
    // XCTest calls it before each test method.
    // Perform any asynchronous setup in this method.
    override func setUp() async throws {
        
        executionTimeAllowance = 1;
        continueAfterFailure = false;

        await todoRepository.addTodos(todos: [
            Todo(id: todosIds[0], title: "Design", description: "Cathy Daisy Simon Jonathan", theme: .yellow),
            Todo(id: todosIds[1],title: "App Dev", description: "Dev app nhe", theme: .orange),
            Todo(id: todosIds[2],title: "Web Dev", description: "Dev web app", theme: .bubblegum)
        ]);
    }
    
    override func setUp() {
        // This is the setUp() instance method.
        // XCTest calls it before each test method.
        // Set up any synchronous per-test state here.
    }
    
    // This is the setUpWithError() instance method.
    // XCTest calls it before each test method.
    // Set up any synchronous per-test state that might throw errors here.
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // This is the tearDown() instance method.
        // XCTest calls it after each test method.
        // Perform any synchronous per-test cleanup here.
    }
    
    override func tearDownWithError() throws {
        // This is the tearDownWithError() instance method.
        // XCTest calls it after each test method.
        // Perform any synchronous per-test cleanup that might throw errors here.
    }
    
    override func tearDown() async throws {
        // This is the tearDown() async instance method.
        // XCTest calls it after each test method.
        // Perform any asynchronous per-test cleanup here.
    }
    
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    func testGetTodos() async throws {
        let actual = try await todoRepository.getTodos();
        let expect = [
            Todo(id: todosIds[0],title: "Design", description: "Cathy Daisy Simon Jonathan", theme: .yellow),
            Todo(id: todosIds[1],title: "App Dev", description: "Dev app nhe", theme: .orange),
            Todo(id: todosIds[2],title: "Web Dev", description: "Dev web app", theme: .bubblegum)
        ];
        
        XCTAssertEqual(actual, expect, "Row count was not zero.")
    }
    
    // This is an example of a performance test case.
    func testPerformanceGetTodos() async throws {
        self.measure {
            // Put the code you want to measure the time of here.
            Task {
                let actual = try await todoRepository.getTodos();
                let expect = [
                    Todo(id: todosIds[0],title: "Design", description: "Cathy Daisy Simon Jonathan", theme: .yellow),
                    Todo(id: todosIds[1],title: "App Dev", description: "Dev app nhe", theme: .orange),
                    Todo(id: todosIds[2],title: "Web Dev", description: "Dev web app", theme: .bubblegum)
                ];
                XCTAssertEqual(actual, expect, "Row count was not zero.")
            }
            
        }
    }
    
}
