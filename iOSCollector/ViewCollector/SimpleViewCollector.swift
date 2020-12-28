//
//  SimpleViewCollector.swift
//  iOSCollector
//
//  Created by lizhonglian on 2020/12/28.
//

import SwiftUI

struct SimpleViewCollector: View {
    
    let myViews = [
        "TextView",
        "ButtonView",
        "ThirdView"
    ]
    
    //
    func containedView(viewName: String) -> AnyView {
        switch viewName {
        case "TextView":
            return AnyView(TextView())
        case "ButtonView":
            return AnyView(ButtonView())
        default:
            return AnyView(Text("None"))
        }
    }
    
    
    var body: some View {
        NavigationView {
            List(myViews, id: \.self) { viewName in
                NavigationLink(destination: self.containedView(viewName: viewName)) {
                    Text(viewName)
                }
            }
            .navigationBarTitle(Text("iOS Collector"), displayMode: .automatic)
            .onAppear {
                NSLog("🚩 iOS Collector")
            }
        }
    }
}

struct SimpleViewCollector_Previews: PreviewProvider {
    static var previews: some View {
        SimpleViewCollector()
    }
}
