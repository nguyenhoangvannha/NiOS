//
//  ContentView.swift
//  NhaDoiOS
//
//  Created by Nguyễn Hoàng Văn Nhã on 3/9/22.
//

import SwiftUI

struct MeetingView: View {
    var body: some View {
        VStack {
            ProgressView(value: 3, total: 100)
            HStack {
                VStack (alignment: .leading) {
                    Text("Seconds Elapsed").font(.caption)
                    Label("3", systemImage:  "hourglass.bottomhalf.fill")
                }
                Spacer()
                VStack (alignment: .trailing) {
                    Text("Seconds Remaining").font(.caption)
                    Label("97", systemImage: "hourglass.tophalf.fill")
                }
            }
            .accessibilityElement(children: .ignore)
            .accessibilityLabel("Time remaining")
            .accessibilityValue("97 seconds")
            Circle().strokeBorder(lineWidth: 24)
            HStack {
                Text("Speaker 1 of 4")
                Spacer()
                Button(action: {}) {
                    Image(systemName: "forward.fill")
                }
                .accessibilityValue("Next speaker")
            }
        }.padding()
        
    }
}

struct MeetingView_Previews: PreviewProvider {
    static var previews: some View {
        MeetingView()
.previewInterfaceOrientation(.portrait)
    }
}
