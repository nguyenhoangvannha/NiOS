//
//  TodosView.swift
//  NhaDoiOS
//
//  Created by Nguyễn Hoàng Văn Nhã on 3/9/22.
//

import SwiftUI

struct TodosView: View {
    @Binding var todos: [Todo]
    var body: some View {
        List{
            ForEach($todos) { $todo in
                NavigationLink(destination: DetailView(todo: $todo)) {
                    CardView(todo: todo)
                }
                .listRowBackground(todo.theme.mainColor)
            }
        }
        .navigationTitle("Daily Todos")
        .toolbar {
            ToolbarItemGroup(placement: .bottomBar) {
                Button(action: {}) {
                    Image(systemName: "plus")
                }.accessibilityLabel("New Todo")
                
                NavigationLink(destination: UserPreferencesView()) {
                    Image(systemName: "ellipsis")
                }
                .accessibilityLabel("More")
            }
        }
    }
}

struct TodosView_Previews: PreviewProvider {
    
    static var previews: some View {
        NavigationView{
            TodosView(todos: .constant(Todo.sampleData))
        }
    }
}
