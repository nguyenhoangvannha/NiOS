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
        return try await withCheckedThrowingContinuation { continuation in
            DispatchQueue.global(qos: .background).sync {
                do {
                    let fileURL1 = try self.fileURL()
                    guard let file = try? FileHandle(forReadingFrom: fileURL1) else {
                        DispatchQueue.main.async {
                            continuation.resume(with: .success([]))
                        }
                        return
                    }
                    let todos = try JSONDecoder().decode([Todo].self, from: file.availableData)
                    DispatchQueue.main.async {
                        continuation.resume(with: .success(todos))
                    }
                } catch {
                    DispatchQueue.main.async {
                        continuation.resume(with: .failure(error))
                    }
                }
            }
        }
    }
    
    func save(todos: [Todo]) async throws -> Int {
        return try await withCheckedThrowingContinuation { continuation in
            DispatchQueue.global(qos: .background).sync {
                do {
                    let data = try JSONEncoder().encode(todos)
                    let outfile = try self.fileURL()
                    try data.write(to: outfile)
                    DispatchQueue.main.async {
                        continuation.resume(with: .success(todos.count))
                    }
                } catch {
                    DispatchQueue.main.async {
                        continuation.resume(with: .failure(error))
                    }
                }
            }
        }
    }
}
