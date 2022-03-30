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
    
    func load(completion: @escaping (Result<[Todo], Error>)->Void) {
        DispatchQueue.global(qos: .background).sync {
            do {
                let fileURL = try self.fileURL()
                guard let file = try? FileHandle(forReadingFrom: fileURL) else {
                    DispatchQueue.main.async {
                        completion(.success([]))
                    }
                    return
                }
                let todos = try JSONDecoder().decode([Todo].self, from: file.availableData)
                DispatchQueue.main.async {
                    completion(.success(todos))
                }
            } catch {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }
    }
    
    func save(todos: [Todo], completion: @escaping (Result<Int, Error>)->Void) {
        DispatchQueue.global(qos: .background).sync {
            do {
                let data = try JSONEncoder().encode(todos)
                let outfile = try self.fileURL()
                try data.write(to: outfile)
                DispatchQueue.main.async {
                    completion(.success(todos.count))
                }
            } catch {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }
    }
}
