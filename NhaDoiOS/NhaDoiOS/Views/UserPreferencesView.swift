//
//  UserPreferencesView.swift
//  NhaDoiOS
//
//  Created by Nguyễn Hoàng Văn Nhã on 3/23/22.
//

import SwiftUI

struct UserPreferencesView: View {
    @Environment(\.locale) var locale: Locale
    @Environment(\.myCustomValue) var customeValue: String
    var body: some View {
        HStack{
            Text("Locale")
            Spacer()
            Text(locale.identifier)
        }
        HStack{
            Text("My Custom value")
            Spacer()
            Text(customeValue)
        }
    }
}
