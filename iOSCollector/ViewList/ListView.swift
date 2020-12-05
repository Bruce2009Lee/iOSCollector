//
//  ListView.swift
//  iOSCollector
//
//  Created by lizhonglian on 2020/12/5.
//

import SwiftUI

struct ListView: View {
    var body: some View {
        
        //创建一个包含 50 个可滚动的项的表
        List(0..<50){ item in
         Text("Item # \(item)")
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
