//
//  NumberView.swift
//  iOSCollector
//
//  Created by lizhonglian on 2020/12/7.
//

import SwiftUI

struct NumberView: View {
    
    @ObservedObject var counter: NumberCount
    
    var body: some View {
        VStack {
            Text("Hello, World!: \(counter.count)")
            
            Button(action: {
                                self.counter.decrease()
                            },
                    label: {
                                Text("-").font(.title)
                        }
                )
            Button(action: {
                                self.counter.add()
                            },
                    label: {
                        Text("+").font(.title)
                        }
                )
        }
        
    }
}

struct NumberView_Previews: PreviewProvider {
    static var previews: some View {
        NumberView(counter: NumberCount())
    }
}
