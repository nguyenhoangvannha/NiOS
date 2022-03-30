//
//  TodoRepository.swift
//  NhaDoiOS
//
//  Created by Nguyễn Hoàng Văn Nhã on 3/30/22.
//

import Foundation

class TodoRepository: AbstractTodoRepository {
    private let todoLocalDataSource: AbstractTodoDataSource
    
    init(todoLocalDataSource: AbstractTodoDataSource){
        self.todoLocalDataSource = todoLocalDataSource
    }
    
    func getTodos() async throws -> [Todo] {
        return try await todoLocalDataSource.getTodos()
    }
    
    func addTodos(todos: [Todo]) async {
        return await todoLocalDataSource.addTodos(todos: todos)
    }
}
