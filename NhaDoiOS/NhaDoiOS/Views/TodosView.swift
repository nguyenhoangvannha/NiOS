//
//  TodosView.swift
//  NhaDoiOS
//
//  Created by Nguyễn Hoàng Văn Nhã on 3/9/22.
//

import SwiftUI

struct TodosView: View {
    let todos: [Todo]
    var body: some View {
        List{
            ForEach(todos) { todo in
                NavigationLink(destination: Text(todo.title)) {
                    CardView(todo: todo)
                }
                .listRowBackground(todo.theme.mainColor)
            }
        }
        .navigationTitle("Daily Todos")
        .toolbar {
            Button(action: {}) {
                Image(systemName: "plus")
            }
            .accessibilityLabel("New Todo")
        }
    }
}

struct TodosView_Previews: PreviewProvider {
    
    static var previews: some View {
        NavigationView{
            TodosView(todos: Todo.sampleData)
        }
    }
}
