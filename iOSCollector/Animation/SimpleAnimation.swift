//
//  SimpleAnimation.swift
//  iOSCollector
//
//  Created by lizhonglian on 2020/12/13.
//

import SwiftUI

struct SimpleAnimation: View {
    
    @State private var animationAmount: CGFloat = 1
    
    var body: some View {
        Button("Tap Me") {
            // self.animationAmount += 1
        }
        .padding(40)
        .background(Color.red)
        .foregroundColor(.white)
        .clipShape(Circle())
        .overlay(
            Circle()
                .stroke(Color.red)
                .scaleEffect(animationAmount)
                .opacity(Double(2 - animationAmount))
                .animation(
                    Animation.easeOut(duration: 1)
                        .repeatForever(autoreverses: false)
                )
        )
        .onAppear {
            self.animationAmount = 2
        }
    }
}

struct SimpleAnimation_Previews: PreviewProvider {
    static var previews: some View {
        SimpleAnimation()
    }
}
