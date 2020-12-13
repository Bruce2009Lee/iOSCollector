//
//  SimpleState.swift
//  iOSCollector
//
//  Created by lizhonglian on 2020/12/13.
//

import SwiftUI

struct SimpleState: View {
    
    @ObservedObject private var user = User()
    
    @State private var showingSheet = false
    
    var body: some View {
        VStack {
            Text("Your name is \(user.firstName) \(user.lastName).")
            
            TextField("First name", text: $user.firstName)
            TextField("Last name", text: $user.lastName)
            
            Button("Show Sheet") {
                self.showingSheet.toggle()
            }.sheet(isPresented: $showingSheet) {
                SecondView(name: "zhonglian")
            }
        }
    }
}

struct SecondView: View {
    
    var name: String
    
    //该属性附加到存储在应用程序环境中的演示模式变量中
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        Button("Dismiss") {
            // 解包以检索实际的呈现方式
            self.presentationMode.wrappedValue.dismiss()
        }
    }
}

class User : ObservableObject{
    @Published var firstName = "Bilbo"
    @Published var lastName = "Baggins"
}

struct SimpleState_Previews: PreviewProvider {
    static var previews: some View {
        SimpleState()
    }
}
