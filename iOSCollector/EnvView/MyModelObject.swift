//
//  MyModelObject.swift
//  iOSCollector
//
//  Created by lizhonglian on 2020/12/6.
//

import Foundation
import Combine

class MyModelObject : ObservableObject {
    
    var didChange = PassthroughSubject<Void, Never>()
    var count = 0
    
    func updateCount() {
        count += 1
        didChange.send()
    }
}
