//
//  SwiftImageView.swift
//  iOSCollector
//
//  Created by lizhonglian on 2020/12/10.
//

import SwiftUI

struct SwiftImageView: View {
    var body: some View {
        
        GeometryReader { geo in
                Image("kala")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: geo.size.width)
            }
    }
}

struct SwiftImageView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftImageView()
    }
}
