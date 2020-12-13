//
//  SimpleScrollView.swift
//  iOSCollector
//
//  Created by lizhonglian on 2020/12/13.
//

import SwiftUI

struct SimpleScrollView: View {
    var body: some View {
        
        ScrollView(.vertical) {
            VStack(spacing: 10) {
                ForEach(0..<100) {
                    Text("Item \($0)")
                        .font(.title)
                }
            }
            // 使滚动到宽度为整个屏幕宽度
            .frame(maxWidth: .infinity)
        }
    }
}

struct SimpleScrollView_Previews: PreviewProvider {
    static var previews: some View {
        SimpleScrollView()
    }
}
