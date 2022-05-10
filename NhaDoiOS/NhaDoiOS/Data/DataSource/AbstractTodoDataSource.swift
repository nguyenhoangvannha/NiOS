//
//  AbstractTodoDataSource.swift
//  NhaDoiOS
//
//  Created by Nguyễn Hoàng Văn Nhã on 3/30/22.
//

import Foundation

protocol AbstractTodoDataSource {
    func getTodos() async throws -> [Todo]
    func addTodos(todos: [Todo]) async throws
}
