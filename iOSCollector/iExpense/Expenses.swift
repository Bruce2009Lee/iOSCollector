//
//  Expenses.swift
//  iOSCollector
//
//  Created by lizhonglian on 2020/12/13.
//

import Foundation
import Combine


class Expenses: ObservableObject {
    
    @Published
    var items = [ExpenseItem]() {
        didSet {
            let encoder = JSONEncoder()
            
            //当 items 中的数据发生变化，就存入到 UserDefaults中
            if let encoded = try? encoder.encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    
    init() {
        
        // 该行尝试读取“Items”中的内容作为Data对象
        if let items = UserDefaults.standard.data(forKey: "Items") {
            let decoder = JSONDecoder()
            
            //它实际上完成了将Data对象解归档为ExpenseItem对象数组的工作。
            if let decoded = try? decoder.decode([ExpenseItem].self, from: items) {
                self.items = decoded
                return
            }
        }

        self.items = []
    }
}
