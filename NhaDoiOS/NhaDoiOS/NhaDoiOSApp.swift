//
//  NhaDoiOSApp.swift
//  NhaDoiOS
//
//  Created by Nguyễn Hoàng Văn Nhã on 3/9/22.
//

import SwiftUI

@main
struct NhaDoiOSApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView{
                TodosView(todos: Todo.sampleData)
            }
        }
    }
}
