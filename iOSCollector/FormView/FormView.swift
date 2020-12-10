//
//  FormView.swift
//  iOSCollector
//
//  Created by lizhonglian on 2020/12/9.
//

import SwiftUI

struct FormView: View {
    
    let students = ["Harry", "Hermione", "Ron"]
    @State private var selectedStudent = 0

    
    var body: some View {
        VStack {
            Picker("Select your student", selection: $selectedStudent) {
                ForEach(0 ..< students.count) {
                    Text(self.students[$0])
                }
            }
            Text("You chose: Student # \(students[selectedStudent])")
        }
    }
}

struct FormView_Previews: PreviewProvider {
    static var previews: some View {
        FormView()
    }
}
