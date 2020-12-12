//
//  SimpleStepperView.swift
//  iOSCollector
//
//  Created by lizhonglian on 2020/12/12.
//

import SwiftUI

struct SimpleStepperView: View {
    
    @State private var sleepAmount = 8.0
    
    @State private var wakeUp = Date()
    
    var body: some View {
        VStack {
            Stepper(value: $sleepAmount, in: 4...12, step: 0.25) {
                Text("\(sleepAmount, specifier: "%.2f") hours")
            }
            
            DatePicker("Please enter a date", selection: $wakeUp, in: Date()...)
                .labelsHidden()
        }
    }
}

struct SimpleStepperView_Previews: PreviewProvider {
    static var previews: some View {
        SimpleStepperView()
    }
}
