//
//  PodcastPlayer.swift
//  iOSCollector
//
//  Created by lizhonglian on 2020/12/7.
//

import Foundation

import Combine

final class PodcastPlayer: ObservableObject {
    @Published private(set) var isPlaying: Bool = false

    func play() {
        isPlaying = true
    }

    func pause() {
        isPlaying = false
    }
}
