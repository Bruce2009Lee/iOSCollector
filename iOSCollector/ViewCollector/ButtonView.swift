//
//  ButtonView.swift
//  iOSCollector
//
//  Created by lizhonglian on 2020/12/28.
//

import SwiftUI

struct ButtonView: View {
    
    @State private var showAlert1 = false
    
    @State private var showAlert2 = false
    
    var body: some View {
        VStack(spacing: 20) {
            Button("frame"){
                self.showAlert1.toggle()
            }
            .frame(width: 120, height: 50, alignment: .center)
            .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
            .alert(isPresented: $showAlert1) {
                Alert(title: Text("提示"),
                      message: Text(".frame(width: 120, height: 50, alignment: .center) \n .border(.black)"),
                      dismissButton: .default(Text("OK"))
                )
            }
            
            Button("i am a button"){
                self.showAlert2.toggle()
            }
            .frame(width: 120, height: 50, alignment: .center)
            .background(Color.yellow)
            .foregroundColor(.white)
            .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
            .cornerRadius(6.0)
            .alert(isPresented: $showAlert2) {
                Alert(title: Text("提示"),
                      message: Text(".border(.black) \n .foregroundColor(.white) \n  .background(Color.yellow)"),
                      dismissButton: .default(Text("OK"))
                )
            }
        }
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView()
    }
}
