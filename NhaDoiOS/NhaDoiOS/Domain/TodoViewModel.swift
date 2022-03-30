//
//  TodoViewModel.swift
//  NhaDoiOS
//
//  Created by Nguyễn Hoàng Văn Nhã on 3/30/22.
//

import Foundation


class TodoViewModel: ObservableObject {
    @Published var todos: [Todo] = []
    
    func refresh() async {
        let fetchedTodos = await fetchTodos()
        self.todos = fetchedTodos
    }
    
    func fetchTodos() async -> [Todo] {
        return Todo.sampleData
    }
    
    func addTodo(todo: Todo) {
        todos.append(todo)
    }
}
