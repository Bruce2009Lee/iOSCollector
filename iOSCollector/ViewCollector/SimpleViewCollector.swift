//
//  SimpleViewCollector.swift
//  iOSCollector
//
//  Created by lizhonglian on 2020/12/28.
//

import SwiftUI

struct SimpleViewCollector: View {
    
    @State private var oneView:[String]? = ["TextView","ButtonView"]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(0..<5){item in
                    NavigationLink(destination: Text("\(item)")) {
                        Text("\(item)")
                    }
                }
            }.navigationBarTitle("iOS Collector")
        }
    }
}

struct SimpleViewCollector_Previews: PreviewProvider {
    static var previews: some View {
        SimpleViewCollector()
    }
}
