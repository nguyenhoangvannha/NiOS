//
//  TodoStore.swift
//  NhaDoiOS
//
//  Created by Nguyễn Hoàng Văn Nhã on 3/30/22.
//

import Foundation

class TodoStore {
    private func fileURL() throws -> URL {
        try FileManager.default.url(for: .documentDirectory,
                                    in: .userDomainMask,
                                    appropriateFor: nil,
                                    create: false)
        .appendingPathComponent("todos.data")
    }
    
    func load() async throws -> [Todo] {
        let fileURL1 = try self.fileURL()
        guard let file = try? FileHandle(forReadingFrom: fileURL1) else {
            return []
        }
        let todos = try JSONDecoder().decode([Todo].self, from: file.availableData)
        return todos
    }
    
    func save(todos: [Todo]) async throws -> Int {
        let data = try JSONEncoder().encode(todos)
        let outfile = try self.fileURL()
        try data.write(to: outfile)
        return todos.count
    }
}
