//
//  NhaDoiOSApp.swift
//  NhaDoiOS
//
//  Created by Nguyễn Hoàng Văn Nhã on 3/9/22.
//

import SwiftUI

@main
struct NhaDoiOSApp: App {
    //    @State private var todos = Todo.sampleData

    @Inject
    private var todoViewModel: TodoViewModel!
    
    var body: some Scene {
        WindowGroup {
            NavigationView{
                TodosView(
                    //todos: $todos
                )
            }
            .environment(\.myCustomValue, "Feature 1 enable")
            //.myCustomValue("Feature 1 disable")
            .environmentObject(todoViewModel)
            //            .onAppear {
            //                Task {
            //                    do {
            //                        try await todoViewModel.refresh()
            //                    } catch {
            //                        fatalError("Error load todos")
            //                    }
            //                }
            //            }
            .task {
                await todoViewModel.refresh()
            }
        }
    }
}
