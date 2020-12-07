//
//  NumberCount.swift
//  iOSCollector
//
//  Created by lizhonglian on 2020/12/7.
//

import Foundation

import Combine

class NumberCount: ObservableObject {
    @Published
    var count:Int = 0
    
    func add() {
        count = count + 1
    }
    
    func decrease() {
        count = count - 1
    }
}
