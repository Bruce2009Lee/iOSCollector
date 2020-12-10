//
//  SwiftAlertView.swift
//  iOSCollector
//
//  Created by lizhonglian on 2020/12/10.
//

import SwiftUI

struct SwiftAlertView: View {
    
    @State private var showingAlert = false
    
    
    var body: some View {
        Button("Show Alert") {
            self.showingAlert = true
        }
        .alert(isPresented: $showingAlert) {
            Alert(title: Text("Hello SwiftUI!"),
                  message: Text("This is some detail message"),
                  dismissButton: .default(Text("OK")))
        }
    }
}

struct SwiftAlertView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftAlertView()
    }
}
