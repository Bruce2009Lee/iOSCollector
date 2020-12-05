//
//  LoginFirstView.swift
//  iOSCollector
//
//  Created by lizhonglian on 2020/12/5.
//

import SwiftUI

struct LoginFirstView: View {
    
    @ObservedObject var loginButton : IsLogin
    
    var body: some View {
        VStack{
            Text("用户名")
            Text("密码")
            Button(action: {
                //这里写触发方法
                self.loginButton.login()
            }) {
                Text("登录")
            } // 这里写一个button 来触发
            
        }
    }
}

struct second: View {
    var body: some View {
        VStack{
            Text("世界")
            Text("你好")
            
        }
    }
}


struct LoginFirstView_Previews: PreviewProvider {
    static var previews: some View {
        LoginFirstView(loginButton: IsLogin())
    }
}
