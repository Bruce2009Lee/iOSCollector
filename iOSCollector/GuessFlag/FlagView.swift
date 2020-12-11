//
//  FlagView.swift
//  iOSCollector
//
//  Created by lizhonglian on 2020/12/10.
//

import SwiftUI

struct FlagView: View {
    
    @State var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    
    @State var correctAnswer = Int.random(in: 0...2)
    
    @State private var showingScore = false
    
    @State private var score:Int = 0
    
    @State private var totalNumber:Int = 0
    
    @State private var scoreTitle = ""
    
    @State private var msg = ""
    
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct"
            self.score += 1
            self.msg = "Your score is \(self.score)"
        } else {
            scoreTitle = "Wrong"
            self.msg = "this is \(countries[number])"
        }
        self.totalNumber += 1
        showingScore = true
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue, .black]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            VStack(spacing: 30) {
                VStack {
                    Text("Tap the flag of")
                        .foregroundColor(.white)
                    Text(countries[correctAnswer])
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .fontWeight(.black)
                }
                
                ForEach(0 ..< 3) { number in
                    Button(action: {
                        self.flagTapped(number)
                    }) {
                        Image(self.countries[number])
                            .renderingMode(.original)
                            .clipShape(Capsule())
                            .overlay(Capsule().stroke(Color.black, lineWidth: 1))
                            .shadow(color: .black, radius: 2)
                    }
                }
                
                Section(header: Text("Total score").foregroundColor(.white)) {
                    Text("\(self.score)/\(self.totalNumber)")
                        .foregroundColor(.white)
                }
                Spacer()
            }
            
        }.alert(isPresented: $showingScore) {
            Alert(title: Text(scoreTitle), message: Text(self.msg), dismissButton: .default(Text("Continue")) {
                self.askQuestion()
            })
        }
    }
}

struct FlagView_Previews: PreviewProvider {
    static var previews: some View {
        FlagView()
    }
}
