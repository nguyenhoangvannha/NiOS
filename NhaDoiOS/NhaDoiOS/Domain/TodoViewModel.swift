//
//  TodoViewModel.swift
//  NhaDoiOS
//
//  Created by Nguyễn Hoàng Văn Nhã on 3/30/22.
//

import Foundation


class TodoViewModel: ObservableObject {
    private let todoRepository: AbstractTodoRepository
    
    @Published var todos: [Todo] = []
    
    init(todoRepository: AbstractTodoRepository){
        self.todoRepository = todoRepository
    }
    
    func refresh() async {
        do {
            let fetchedTodos = try await todoRepository.getTodos()
            self.todos = fetchedTodos
        } catch {
            
        }
         
        
    }
    
    func addTodo(todo: Todo) async {
        await todoRepository.addTodos(todos: [todo])
        todos.append(todo)
    }
}
