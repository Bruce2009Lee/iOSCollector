//
//  SimplePackage.swift
//  iOSCollector
//
//  Created by lizhonglian on 2020/12/27.
//

import SwiftUI
import SamplePackage


struct SimplePackage: View {
    
    let possibleNumbers = Array(1...60)
    
    var results: String {
        let selected = possibleNumbers.random(7).sorted()

        // 也许更熟悉的写法是这样
        let strings = selected.map { String.init($0) }
        return strings.joined(separator: ", ")
    }
    
    
    var body: some View {
        Text(results)
    }
}

struct SimplePackage_Previews: PreviewProvider {
    static var previews: some View {
        SimplePackage()
    }
}
