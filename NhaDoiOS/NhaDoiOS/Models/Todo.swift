//
//  Todo.swift
//  NhaDoiOS
//
//  Created by Nguyễn Hoàng Văn Nhã on 3/9/22.
//

import Foundation

struct Todo: Identifiable, Decodable, Encodable, Equatable {
    let id: UUID
    var title, description: String
    var theme: Theme
    
    init(id: UUID = UUID(), title: String, description: String, theme: Theme) {
        self.id = id
        self.title = title
        self.description = description
        self.theme = theme
    }
    
    static func == (lhs: Todo, rhs: Todo) -> Bool {
        return
        lhs.id == rhs.id &&
        lhs.title == rhs.title &&
        lhs.description == rhs.description &&
        lhs.theme == rhs.theme
    }
}


extension Todo {
    static let sampleData: [Todo] =
    [
        Todo(title: "Design", description: "Cathy Daisy Simon Jonathan", theme: .yellow),
        Todo(title: "App Dev", description: "Dev app nhe", theme: .orange),
        Todo(title: "Web Dev", description: "Dev web app", theme: .bubblegum)
    ]
    
    struct Data {
        var title: String = ""
        var description: String = ""
        var theme: Theme = .seafoam
    }
    
    var data: Data {
        Data(title: title, description: description, theme: theme)
    }
    
    mutating func update(from data: Data) {
        title = data.title
        description = data.description
        theme = data.theme
    }
    
    init(data: Data) {
        id = UUID()
        title = data.title
        description = data.description
        theme = data.theme
    }
}
