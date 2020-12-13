//
//  ExpenseItem.swift
//  iOSCollector
//
//  Created by lizhonglian on 2020/12/13.
//

import Foundation
import Combine

struct ExpenseItem :Codable, Identifiable{
    let id = UUID()
    let name: String
    let type: String
    let amount: Int
}
