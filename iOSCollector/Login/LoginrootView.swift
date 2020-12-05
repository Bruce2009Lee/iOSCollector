//
//  LoginrootView.swift
//  iOSCollector
//
//  Created by lizhonglian on 2020/12/5.
//

import SwiftUI

struct LoginrootView: View {
    
    @ObservedObject var login = IsLogin()
    
    var body: some View {
        VStack{
            
            // 当isLogin 被置成true时，用到isLogin的页面都会刷新；因此这里会进行判断，显示哪个view
            if self.login.isLogin == false{
                LoginFirstView(loginButton: self.login)
            }else{
                LoginSecondView()
            }
        }
    }
}

struct LoginrootView_Previews: PreviewProvider {
    static var previews: some View {
        LoginrootView(login: IsLogin())
    }
}
