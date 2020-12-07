//
//  EpisodesView.swift
//  iOSCollector
//
//  Created by lizhonglian on 2020/12/7.
//

import SwiftUI

struct EpisodesView: View {
    
    @ObservedObject var player: PodcastPlayer
    
    var body: some View {
        VStack {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            
            Button(action: {
                                if self.player.isPlaying {
                                    self.player.pause()
                                } else {
                                    self.player.play()
                                }
                        }, label: {
                                Text(player.isPlaying ? "Pause": "Play")
                        }
                )
        }
        
    }
}

struct EpisodesView_Previews: PreviewProvider {
    static var previews: some View {
        EpisodesView(player: PodcastPlayer())
    }
}
