//
//  SimpleDraw.swift
//  iOSCollector
//
//  Created by lizhonglian on 2020/12/20.
//

import SwiftUI

struct SimpleDraw: View {
    var body: some View {
        Path { path in
            path.move(to: CGPoint(x: 200, y: 100))
            path.addLine(to: CGPoint(x: 100, y: 300))
            path.addLine(to: CGPoint(x: 300, y: 300))
            path.addLine(to: CGPoint(x: 200, y: 100))
            
            //SwiftUI确保线与前后的线连接整齐，而不仅仅是一系列单独的线，但是我们的最后一行之后没有任何内容，因此无法建立连接。
            path.addLine(to: CGPoint(x: 100, y: 300))
        }
        .stroke(Color.blue.opacity(0.25), lineWidth: 20)
    
        
    }
}

struct SimpleDraw_Previews: PreviewProvider {
    static var previews: some View {
        SimpleDraw()
    }
}
