//
//  Songs.swift
//  iOSCollector
//
//  Created by lizhonglian on 2020/12/20.
//

import Foundation


struct Response: Codable {
    var results: [Result]
}

struct Result: Codable {
    var trackId: Int
    var trackName: String
    var collectionName: String
}


