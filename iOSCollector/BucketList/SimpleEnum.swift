//
//  SimpleEnum.swift
//  iOSCollector
//
//  Created by lizhonglian on 2020/12/27.
//

import SwiftUI

struct SimpleEnum: View {
    
    private var loadingState = LoadingState.success
    
    var body: some View {
        Group {
            if loadingState == .loading {
                LoadingView()
            } else if loadingState == .success {
                SuccessView()
            } else if loadingState == .failed {
                FailedView()
            }
        }
    }
}

enum LoadingState {
    case loading, success, failed
}

struct LoadingView: View {
    var body: some View {
        Text("Loading...")
    }
}

struct SuccessView: View {
    var body: some View {
        Text("Success!")
    }
}

struct FailedView: View {
    var body: some View {
        Text("Failed.")
    }
}

struct SimpleEnum_Previews: PreviewProvider {
    static var previews: some View {
        SimpleEnum()
    }
}
