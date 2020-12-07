//
//  EnvironmentView.swift
//  iOSCollector
//
//  Created by lizhonglian on 2020/12/6.
//

import SwiftUI

struct EnvironmentView: View {
    var body: some View {
        RootView().environmentObject(MyModelObject())
    }
}

struct RootView: View {
    var body: some View {
        VStack(spacing: 20) {
            ChildView1()
            ChildView2()
        }
    }
}

struct ChildView1: View {
    @EnvironmentObject
    var model: MyModelObject

    var body: some View {
        Button(action: {
            self.model.updateCount()
        }) {
            Text("Button").font(Font/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
        }
    }
}

struct ChildView2: View {
    @EnvironmentObject
    var model: MyModelObject
    
    var body: some View {
        Text("\(model.count)")
    }
}

struct EnvironmentView_Previews: PreviewProvider {
    static var previews: some View {
        EnvironmentView()
    }
}
