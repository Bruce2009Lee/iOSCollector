//
//  SimpleBindView.swift
//  iOSCollector
//
//  Created by lizhonglian on 2020/12/21.
//

import SwiftUI

struct SimpleBindView: View {
    
    @State private var rememberMe = false
    
    @State private var commonButton = false
    
    var body: some View {
        VStack {
            
            //$rememberMe 传递的是绑定本身
            PushButton(title: "Remember Me", isOn: $rememberMe)
            Text(rememberMe ? "On" : "Off")
            
            Spacer()
            
            Button("commonButton"){
                self.commonButton.toggle()
            }
            Text(commonButton ? "On" : "Off")
        }
    }
}

struct PushButton: View {
    let title: String
    
    //@Binding 使我们可以在视图中创建一个可变值，该值实际上指向其他位置的其他值
    @Binding var isOn: Bool
    
    var onColors = [Color.red, Color.yellow]
    var offColors = [Color(white: 0.6), Color(white: 0.4)]
    
    var body: some View {
        Button(title) {
            self.isOn.toggle()
        }
        .padding()
        .background(LinearGradient(gradient: Gradient(colors: isOn ? onColors : offColors), startPoint: .top, endPoint: .bottom))
        .foregroundColor(.white)
        .clipShape(Capsule())
        .shadow(radius: isOn ? 0 : 5)
    }
}


struct SimpleBindView_Previews: PreviewProvider {
    static var previews: some View {
        SimpleBindView()
    }
}
