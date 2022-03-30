//
//  TodoLocalDataSource.swift
//  NhaDoiOS
//
//  Created by Nguyễn Hoàng Văn Nhã on 3/30/22.
//

import Foundation


class TodoLocalDataSource: AbstractTodoDataSource{
    private let todoStore: TodoStore
    
    init(todoStore: TodoStore){
        self.todoStore = todoStore
    }
    
    func getTodos() async throws -> [Todo] {
        try await withCheckedThrowingContinuation { continuation in
            todoStore.load { result in
                switch result {
                case .failure(let error):
                    continuation.resume(throwing: error)
                case .success(let todos):
                    continuation.resume(returning: todos)
                }
            }
        }
    }
    
    func addTodos(todos: [Todo]) async {
        todoStore.save(todos: todos, completion: { result in
            switch result {
            case .failure(let error):
                fatalError(error.localizedDescription)
            case .success(_):
                break
            }
        })
    }
}
