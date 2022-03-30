//
//  TodosView.swift
//  NhaDoiOS
//
//  Created by Nguyễn Hoàng Văn Nhã on 3/9/22.
//

import SwiftUI

struct TodosView: View {
    //@Binding var todos: [Todo]
    @EnvironmentObject var todoViewModel: TodoViewModel
    @State private var isPresentingNewTodoView = false
    @State private var newTodoData = Todo.Data()
    var body: some View {
        List{
            ForEach($todoViewModel.todos) { $todo in
                NavigationLink(destination: DetailView(todo: $todo)) {
                    CardView(todo: todo)
                }
                .listRowBackground(todo.theme.mainColor)
            }
        }
        .navigationTitle("Daily Todos")
        .toolbar {
            ToolbarItemGroup(placement: .bottomBar) {
                Button(action: {
                    isPresentingNewTodoView = true
                }) {
                    Image(systemName: "plus")
                }.accessibilityLabel("New Todo")
                
                NavigationLink(destination: UserPreferencesView()) {
                    Image(systemName: "ellipsis")
                }
                .accessibilityLabel("More")
            }
        }
        .sheet(isPresented: $isPresentingNewTodoView) {
            NavigationView{
                DetailEditView(data: $newTodoData)
                    .toolbar {
                        ToolbarItem(placement: .cancellationAction) {
                            Button("Dismiss") {
                                isPresentingNewTodoView = false
                                newTodoData = Todo.Data()
                            }
                        }
                        ToolbarItem(placement: .confirmationAction) {
                            Button("Add") {
                                isPresentingNewTodoView = false
                                let newTodo = Todo(data: newTodoData)
                                todoViewModel.addTodo(todo: newTodo)
                                newTodoData = Todo.Data()
                            }
                        }
                    }
            }
        }
    }
}

struct TodosView_Previews: PreviewProvider {
    
    static var previews: some View {
        NavigationView{
            TodosView(
                //todos: .constant(Todo.sampleData)
            )
        }
    }
}
