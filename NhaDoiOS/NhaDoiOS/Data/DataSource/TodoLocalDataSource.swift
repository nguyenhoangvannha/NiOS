//
//  TodoLocalDataSource.swift
//  NhaDoiOS
//
//  Created by Nguyễn Hoàng Văn Nhã on 3/30/22.
//

import Foundation


class TodoLocalDataSource: AbstractTodoDataSource{
    private let todoStore: TodoStore!
    
    init(todoStore: TodoStore){
        self.todoStore = todoStore
    }
    
    func getTodos() async throws -> [Todo] {
        try await todoStore.load()
    }
    
    func addTodos(todos: [Todo]) async throws{
       try await todoStore.save(todos: todos)
    }
}
