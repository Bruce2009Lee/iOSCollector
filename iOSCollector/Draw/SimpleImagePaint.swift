//
//  SimpleImagePaint.swift
//  iOSCollector
//
//  Created by lizhonglian on 2020/12/20.
//

import SwiftUI

struct SimpleImagePaint: View {
    var body: some View {
        Text("Hello World")
            .frame(width: 300, height: 300)
            .border(ImagePaint(image: Image("UK"), scale: 0.6), width: 80)
    }
}

struct SimpleCapsule:View {
    var body: some View {
        VStack {
            Spacer()
            Text("Hello World")
                .frame(width: 300, height: 300)
                .border(ImagePaint(image: Image("UK"), sourceRect: CGRect(x: 0, y: 0.25, width: 1, height: 0.5), scale: 0.8), width: 30)
            Spacer()
            Capsule()
                .strokeBorder(ImagePaint(image: Image("UK"), scale: 0.4), lineWidth: 20)
                .frame(width: 300, height: 200)
            Spacer()
        }
    }
}

struct SimpleImagePaint_Previews: PreviewProvider {
    static var previews: some View {
        Section{
            SimpleImagePaint()
        }
        Section {
            SimpleCapsule()
        }
    }
}
