//
//  Astronaut.swift
//  iOSCollector
//
//  Created by lizhonglian on 2020/12/14.
//

import Foundation


//符合Codable，直接从JSON创建这个结构的实例；遵从Identifiable协议，这样我们就可以在ForEach中使用宇航员数组等等——这个id字段会做得很好。
struct Astronaut: Codable, Identifiable {
    let id: String
    let name: String
    let description: String
}
