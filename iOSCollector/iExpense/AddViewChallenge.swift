//
//  AddViewChallenge.swift
//  iOSCollector
//
//  Created by lizhonglian on 2020/12/13.
//

import SwiftUI

struct AddViewChallenge: View {
    
    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount = ""
    
    @State private var showAlert = false
    
    // 在不同的View里面传送数据，需要使用 ObservedObject
    @ObservedObject var expenses: Expenses
    
    @Environment(\.presentationMode) var presentationMode
    
    static let types = ["Business", "Personal"]
    
    private func finishItem(){
        
        let actualAmount = Int(self.amount)
        // 尝试将amount 转化为Int 数据
        if actualAmount != nil {
            let item = ExpenseItem(name: self.name, type: self.type, amount: actualAmount!)
            self.expenses.items.append(item)
            self.presentationMode.wrappedValue.dismiss()
        } else {
            self.showAlert = true
        }
    }
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Name", text: $name)
                Picker("Type", selection: $type) {
                    ForEach(Self.types, id: \.self) {
                        Text($0)
                    }
                }
                TextField("Amount", text: $amount)
                    .keyboardType(.numberPad)
            }
            .navigationBarTitle("Add new expense", displayMode: .inline)
            .navigationBarItems(trailing: Button("Save") {
                finishItem()
            })
        }.alert(isPresented: $showAlert, content: {
            Alert(title: Text("Transfer wrong"),
                  message:Text("Your input amount cannot be transfered to Int"),
                  dismissButton: .default(Text("Continue")){
//                    self.amount = ""
                  })
        })
    }
}

struct AddViewChallenge_Previews: PreviewProvider {
    static var previews: some View {
        AddViewChallenge(expenses: Expenses())
    }
}
