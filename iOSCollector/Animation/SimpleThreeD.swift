//
//  SimpleThreeD.swift
//  iOSCollector
//
//  Created by lizhonglian on 2020/12/13.
//

import SwiftUI

struct SimpleThreeD: View {
    
    @State private var animationAmount = 0.0
    
    var body: some View {
        
        Button("Tap Me") {
            
            //添加显式动画
            withAnimation(.interpolatingSpring(stiffness: 5, damping: 1)) {
                self.animationAmount += 360
            }
        }
        .padding(50)
        .background(Color.red)
        .foregroundColor(.white)
        .clipShape(Circle())
        .rotation3DEffect(.degrees(animationAmount), axis: (x: 0, y: 1, z: 0))
        
    }
}

struct SimpleThreeD_Previews: PreviewProvider {
    static var previews: some View {
        SimpleThreeD()
    }
}
