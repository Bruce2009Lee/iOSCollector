//
//  SimpleComparable.swift
//  iOSCollector
//
//  Created by lizhonglian on 2020/12/27.
//

import SwiftUI
import LocalAuthentication

struct SimpleComparable: View {
    let users = [
        BucketUser(firstName: "Arnold", lastName: "Rimmer"),
        BucketUser(firstName: "Kristine", lastName: "Kochanski"),
        BucketUser(firstName: "David", lastName: "Lister"),
    ].sorted()
    
    @State private var isUnlocked = false
    
    func getDocumentsDirectory() -> URL {
        // 查找该用户的所有可能的文档目录
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        
        // 只需返回第一个，应该是唯一的一个
        return paths[0]
    }
    
    func authenticate() {
        let context = LAContext()
        var error: NSError?
        
        // 检查生物特征认证是否可用
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            // 可用，所以继续使用它
            let reason = "我们需要解锁您的数据"
            
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in
                // 身份验证现已完成
                DispatchQueue.main.async {
                    if success {
                        self.isUnlocked = true
                    } else {
                        // 发生的异常
                    }
                }
            }
        } else {
            // 没有生物识别
        }
    }
    
    var body: some View {
        VStack {
            if self.isUnlocked {
                Text("Unlocked")
            } else {
                Text("Locked")
            }
        }
        .onAppear(perform: authenticate)
    }
}

struct BucketUser: Identifiable,Comparable {
    
    // 实现 Comparable 的< 方法
    static func < (lhs: BucketUser, rhs: BucketUser) -> Bool {
        lhs.lastName < rhs.lastName
    }
    
    let id = UUID()
    let firstName: String
    let lastName: String
}


struct SimpleComparable_Previews: PreviewProvider {
    static var previews: some View {
        SimpleComparable()
    }
}
