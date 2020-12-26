//
//  SimpleSheet.swift
//  iOSCollector
//
//  Created by lizhonglian on 2020/12/26.
//

import SwiftUI

struct SimpleSheet: View {
    @State private var showingSheet = false
    
    var body: some View {
        Button("Show Sheet") {
            self.showingSheet.toggle()
        }
        // 添加sheet操作
        .sheet(isPresented: $showingSheet) {
            
            // 创建 SView
            SView(name: "韦弦zhy")
        }
    }
}

private struct SView: View {
    
    //定义环境的值，从环境中读取视图的演示模式
    @Environment(\.presentationMode) var presentationMode
    
    var name: String
    
    var body: some View {
        Button("Dismiss") {
            
            //调用dismiss方法关闭sheet
            self.presentationMode.wrappedValue.dismiss()
        }
    }
}

struct SimpleSheet_Previews: PreviewProvider {
    static var previews: some View {
        SimpleSheet()
    }
}
