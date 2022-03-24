//
//  TodoTimer.swift
//  NhaDoiOS
//
//  Created by Nguyễn Hoàng Văn Nhã on 3/16/22.
//

import Foundation

class TodoTimer: ObservableObject{
    @Published var secondsElapsed = 0
    @Published var secondsRemaining = 0
}
