//
//  SimpleAlert.swift
//  iOSCollector
//
//  Created by lizhonglian on 2020/12/26.
//

import SwiftUI

struct SimpleAlert: View {
    
    @State private var showingAlert = false
    
    
    var body: some View {
        Button("Show Alert") {
            self.showingAlert = true
        }
        //SwiftUI会在警报解除后自动将showingAlert设置为false。
        .alert(isPresented: $showingAlert) {
            Alert(title: Text("Hello SwiftUI!"),
                  message: Text("This is some detail message"),
                  dismissButton: .default(Text("OK")))
        }
    }
}

struct SimpleAlert_Previews: PreviewProvider {
    static var previews: some View {
        SimpleAlert()
    }
}
