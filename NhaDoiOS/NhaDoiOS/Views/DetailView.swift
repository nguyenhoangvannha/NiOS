//
//  DetailView.swift
//  NhaDoiOS
//
//  Created by Nguyễn Hoàng Văn Nhã on 3/9/22.
//

import SwiftUI

struct DetailView: View {
    @Binding var todo: Todo
    
    @State private var data = Todo.Data()
    @State private var isPresentingEditView = false
    
    @StateObject var todoTimer = TodoTimer()
    
    var body: some View {
        List {
            Section(header: Text("Todo Info")) {
                Label("\(todo.title)", systemImage: "timer")
                    .font(.headline)
                    .foregroundColor(.accentColor)
                HStack {
                    Label("\(todo.description)", systemImage: "clock")
                }
                HStack {
                    Label("Theme", systemImage: "paintpalette")
                    Spacer()
                    Text(todo.theme.name)
                        .padding(4)
                        .foregroundColor(todo.theme.accentColor)
                        .background(todo.theme.mainColor)
                        .cornerRadius(4)
                }
            }
        }
        .toolbar {
            Button("Edit") {
                isPresentingEditView = true
                data = todo.data
            }
        }
        .sheet(isPresented: $isPresentingEditView) {
            NavigationView {
                DetailEditView(data: $data)
                    .navigationTitle(todo.title)
                    .toolbar {
                        ToolbarItem(placement: .cancellationAction) {
                            Button("Cancel") {
                                isPresentingEditView = false
                            }
                        }
                        ToolbarItem(placement: .confirmationAction) {
                            Button("Done") {
                                isPresentingEditView = false
                                todo.update(from: data)
                            }
                        }
                    }
                    .environmentObject(todoTimer)
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider{
    static var previews: some View {
        NavigationView {
            DetailView(todo: .constant(Todo.sampleData[0]))
        }
    }
}
