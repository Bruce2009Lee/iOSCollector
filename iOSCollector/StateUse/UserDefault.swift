//
//  UserDefault.swift
//  iOSCollector
//
//  Created by lizhonglian on 2020/12/13.
//

import SwiftUI

struct UserDefault: View {
    
    @State private var tapCount = UserDefaults.standard.integer(forKey: "Tap")
    
    var body: some View {
        Button("Tap count: \(tapCount)") {
            self.tapCount += 1
            UserDefaults.standard.set(self.tapCount, forKey: "Tap")
        }
    }
}

struct SelfDefinedData: View {
    
    @State private var user = MyUser(firstName: "Taylor", lastName: "Swift")
    
    var body: some View {
        Button("Save User") {
            let encoder = JSONEncoder()

            if let data = try? encoder.encode(self.user) {
                UserDefaults.standard.set(data, forKey: "UserData")
            }
        }
    }
}

struct MyUser: Codable {
    var firstName: String
    var lastName: String
}

struct UserDefault_Previews: PreviewProvider {
    static var previews: some View {
        SelfDefinedData()
    }
}
