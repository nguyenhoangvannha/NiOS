//
//  CustomEnvironmentKey.swift
//  NhaDoiOS
//
//  Created by Nguyễn Hoàng Văn Nhã on 3/23/22.
//

import Foundation
import SwiftUI

private struct MyCustomEnvironmentKey: EnvironmentKey {
    static let defaultValue: String = "Default value"
}

extension EnvironmentValues {
    var myCustomValue: String{
        get {self[MyCustomEnvironmentKey.self]}
        set {self[MyCustomEnvironmentKey.self] = newValue}
    }
}

extension View {
    func myCustomValue(_ myCustomValue: String) -> some View {
        environment(\.myCustomValue, myCustomValue)
    }
}
