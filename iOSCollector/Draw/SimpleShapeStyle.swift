//
//  SimpleShapeStyle.swift
//  iOSCollector
//
//  Created by lizhonglian on 2020/12/20.
//

import SwiftUI

struct SimpleShapeStyle: View {
    var body: some View {
        Path { path in
            path.move(to: CGPoint(x: 200, y: 100))
            path.addLine(to: CGPoint(x: 100, y: 300))
            path.addLine(to: CGPoint(x: 300, y: 300))
            path.addLine(to: CGPoint(x: 200, y: 100))
            path.addLine(to: CGPoint(x: 100, y: 300))
        }
        // ShapeStyle结构体,可以控制每条线在其后应如何连接到该线
        .stroke(Color.blue, style: StrokeStyle(lineWidth: 30, lineCap: .round, lineJoin: .round))
    }
}

struct SimpleShapeStyle_Previews: PreviewProvider {
    static var previews: some View {
        SimpleShapeStyle()
    }
}
