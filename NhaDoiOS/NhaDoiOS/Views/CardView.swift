//
//  CardView.swift
//  NhaDoiOS
//
//  Created by Nguyễn Hoàng Văn Nhã on 3/9/22.
//

import SwiftUI

struct CardView: View {
    let todo: Todo
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(todo.title)
                .font(.headline)
            Spacer()
            HStack{
                Text(todo.description)
                Image(systemName: "clock")
            }
            .font(.caption)
        }
        .padding()
    }
}

struct CardView_Previews: PreviewProvider{
    static var todo = Todo.sampleData[1]
    static var previews: some View {
        CardView(todo: todo)
            .previewLayout(.fixed(width: 400, height: 60))
    }
}
