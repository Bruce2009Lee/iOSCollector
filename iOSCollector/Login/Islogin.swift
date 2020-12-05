//
//  Islogin.swift
//  iOSCollector
//
//  Created by lizhonglian on 2020/12/5.
//

import Foundation
import Combine

class IsLogin: ObservableObject {
    // 这是SwiftUI中的Combine框架所包含的，在所有View中可调用此数据，数据改变便可刷新View 达到跳转目的
    @Published var isLogin = false
    
    func login()  {
        self.isLogin = true
    }
}
