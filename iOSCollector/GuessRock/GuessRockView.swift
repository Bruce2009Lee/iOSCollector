//
//  GuessRockView.swift
//  iOSCollector
//
//  Created by lizhonglian on 2020/12/12.
//

import SwiftUI

struct GuessRockView: View {
    
    @State var gestures = ["剪刀", "石头", "布"].shuffled()
    
    @State var correctAnswer = Int.random(in: 0...2)
    
    @State var score:Int = 0
    
    @State var totalQuestion:Int = 5
    
    @State private var showingResult = false
    @State private var resultTitle = ""
    @State private var msg = ""
    
    func checkAnswer(_ number: Int){
        if gestures[number] == "剪刀" {
            if gestures[correctAnswer] == "布" {
                score += 1
                resultTitle = "赢了"
                self.msg = "你的得分是 \(self.score)"
            } else if gestures[correctAnswer] == "剪刀" {
                //
                resultTitle = "打平"
                self.msg = "你的对手出的也是 \(gestures[correctAnswer])"
            } else {
                resultTitle = "输了"
                self.msg = "你的对手出的是 \(gestures[correctAnswer])"
            }
        } else if gestures[number] == "石头"{
            if gestures[correctAnswer] == "剪刀" {
                score += 1
                resultTitle = "赢了"
                self.msg = "你的得分是 \(self.score)"
            } else if gestures[correctAnswer] == "石头" {
                //
                resultTitle = "打平"
                self.msg = "你的对手出的也是 \(gestures[correctAnswer])"
            } else {
                resultTitle = "输了"
                self.msg = "你的对手出的是 \(gestures[correctAnswer])"
            }
        } else if gestures[number] == "布"{
            if gestures[correctAnswer] == "石头" {
                score += 1
                resultTitle = "赢了"
                self.msg = "你的得分是 \(self.score)"
            } else if gestures[correctAnswer] == "布" {
                //
                resultTitle = "打平"
                self.msg = "你的对手出的也是 \(gestures[correctAnswer])"
            } else {
                resultTitle = "输了"
                self.msg = "你的对手出的是 \(gestures[correctAnswer])"
            }
        }
        
        totalQuestion -= 1
        if totalQuestion == 0 {
            resultTitle = "一轮游戏结束"
            let rate = (Double(score)/5) * 100
            self.msg = "你的胜率是 \(rate)%"
            totalQuestion = 5
            score = 0
        }
        showingResult = true
    }
    
    func continueGame() {
        gestures.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
    
    var body: some View {
        ZStack {
            Color.blue
                .frame(width: .infinity, height: .infinity)
                .edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .center, spacing: 30) {
                VStack {
                    Text("猜丁壳")
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .fontWeight(.black)
                }
                
                Section() {
                    Text("当前分数：\(score) 分")
                        .foregroundColor(.white)
                }
                
                ForEach(0 ..< gestures.count) { number in
                    Button(action: {
                        self.checkAnswer(number)
                    }){
                        Text(self.gestures[number])
                            .frame(width: 150, height: 60)
                            .font(.largeTitle)
                            .foregroundColor(.white)
                            .background(Color.yellow)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                }
                
                Spacer()
            }
        }.alert(isPresented: $showingResult){
            Alert(title: Text(self.resultTitle), message: Text(self.msg), dismissButton: .default(Text("Continue")){
                self.continueGame()
            })
        }
    }
}

struct GuessRockView_Previews: PreviewProvider {
    static var previews: some View {
        GuessRockView()
    }
}
