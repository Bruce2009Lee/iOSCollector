//
//  SwiftImageView.swift
//  iOSCollector
//
//  Created by lizhonglian on 2020/12/10.
//

import SwiftUI

struct SwiftImageView: View {
    var body: some View {
        Button(action: {
            print("Edit button was tapped")
        }) {
            HStack(spacing: 10) {
                Image(systemName: "pencil").renderingMode(.original)
                Text("Edit")
            }
        }
    }
}

struct SwiftImageView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftImageView()
    }
}
