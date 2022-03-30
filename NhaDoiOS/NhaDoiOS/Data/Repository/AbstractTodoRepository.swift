//
//  AbstractTodoRepository.swift
//  NhaDoiOS
//
//  Created by Nguyễn Hoàng Văn Nhã on 3/30/22.
//

import Foundation

protocol AbstractTodoRepository {
    func getTodos() async throws -> [Todo]
    func addTodos(todos: [Todo]) async
}
