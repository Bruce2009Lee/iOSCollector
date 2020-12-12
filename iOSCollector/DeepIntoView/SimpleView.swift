//
//  SimpleView.swift
//  iOSCollector
//
//  Created by lizhonglian on 2020/12/11.
//

import SwiftUI

struct SimpleView: View {
    var body: some View {
        VStack {
            Text("Hello World")
                //            .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.red)
            //            .edgesIgnoringSafeArea(.all)
            
            Button("Button area") {
                print(type(of: self.body))
            }
            .background(Color.red)
            .frame(width: 200, height: 150)
            
            Text("Hello World")
                .padding()
                .background(Color.red)
                .padding()
                .background(Color.blue)
                .padding()
                .background(Color.green)
                .padding()
                .background(Color.yellow)
            
            VStack {
                Text("Gryffindor")
                    .font(.largeTitle)
                    .blur(radius: 0)
                Text("Hufflepuff")
                Text("Ravenclaw")
                Text("Slytherin")
            }
            .font(.title)
            .blur(radius: 3)
            
            Text("Hello World")
                .modifier(Title())
            
            Color.blue
                .frame(width: 150, height: 100)
                .watermarked(with: "Hacking with Swift")
        }
        
        
        
    }
}


struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.white)
            .padding()
            .background(Color.blue)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

struct Watermark: ViewModifier {
    var text: String

    func body(content: Content) -> some View {
        ZStack(alignment: .bottomTrailing) {
            content
            Text(text)
                .font(.caption)
                .foregroundColor(.white)
                .padding(5)
                .background(Color.black)
        }
    }
}

extension View {
    func watermarked(with text: String) -> some View {
        self.modifier(Watermark(text: text))
    }
}

struct SimpleView_Previews: PreviewProvider {
    static var previews: some View {
        SimpleView()
    }
}
