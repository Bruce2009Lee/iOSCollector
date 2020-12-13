//
//  SimpleAnimationBinding.swift
//  iOSCollector
//
//  Created by lizhonglian on 2020/12/13.
//

import SwiftUI

struct SimpleAnimationBinding: View {
    
    @State private var animationAmount: CGFloat = 1
    
    var body: some View {
        VStack {
            Stepper("Scale amount", value: $animationAmount.animation(
                Animation.easeInOut(duration: 1)
                    .repeatCount(3, autoreverses: true)
            ), in: 1...10)
            
            Spacer()
            
            Button("Tap Me") {
                self.animationAmount += 1
            }
            .padding(40)
            .background(Color.red)
            .foregroundColor(.white)
            .clipShape(Circle())
            .scaleEffect(animationAmount)
        }
    }
}

struct SimpleAnimationBinding_Previews: PreviewProvider {
    static var previews: some View {
        SimpleAnimationBinding()
    }
}
