//
//  NavigationView.swift
//  iOSCollector
//
//  Created by lizhonglian on 2020/12/5.
//

import SwiftUI

struct NaviLinkView: View {
    var body: some View {
        NavigationView {
            List(0..<100) { row in
                NavigationLink(destination: Text("Detail \(row)")) {
                    Text("Row \(row)")
                }
            }
            .navigationBarTitle("SwiftUI")
        }
    }
}

struct NaviLinkView_Previews: PreviewProvider {
    static var previews: some View {
        NaviLinkView()
    }
}
