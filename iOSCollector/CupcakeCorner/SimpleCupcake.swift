//
//  SimpleCupcake.swift
//  iOSCollector
//
//  Created by lizhonglian on 2020/12/20.
//

import SwiftUI

struct SimpleCupcake: View {
    
    @State private var username = ""
    @State private var email = ""
    
    @State private var results = [Result]()
    
    func loadData() {
        guard let url = URL(string:"https://itunes.apple.com/search?term=taylor+swift&entity=song") else {
            print("Invalid URL")
            return
        }
        
        let request = URLRequest(url: url)
        
        //URLSession:负责管理网络请求的iOS类
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                if let decodedResponse = try? JSONDecoder().decode(Response.self, from: data) {
                    // 我们得到了有用的数据 - 返回到主线程
                    DispatchQueue.main.async {
                        // 更新我们的UI
                        self.results = decodedResponse.results
                    }
                    
                    // 所有工作都完成了，所以可以退出了
                    return
                }
            }
            
            // 如果代码跑到这里了，说明发生了某些错误
            print("Fetch failed: \(error?.localizedDescription ?? "Unknown error")")
        }.resume()
        
    }
    
    var body: some View {
        List(results, id: \.trackId) { item in
            VStack(alignment: .leading) {
                Text(item.trackName)
                    .font(.headline)
                Text(item.collectionName)
            }
        }
        .onAppear(perform: loadData)
    }
}

private class localUser: ObservableObject, Codable {
    
    enum CodingKeys: CodingKey {
        case name
    }
    
    @Published var name = "Paul Hudson"
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
    }
}

struct SimpleCupcake_Previews: PreviewProvider {
    static var previews: some View {
        SimpleCupcake()
    }
}
