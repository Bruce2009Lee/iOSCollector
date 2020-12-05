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
            NavigationLink(destination:ListView()){
                Text("Listview")
            }.navigationBarTitle("你好",displayMode: .large)
        }
    }
}

struct NaviLinkView_Previews: PreviewProvider {
    static var previews: some View {
        NaviLinkView()
    }
}
