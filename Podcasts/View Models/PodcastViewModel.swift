//
//  PodcastViewModel.swift
//  Podcasts
//
//  Created by Romelys Rivero on 9/20/19.
//  Copyright © 2019 Angel Rivero. All rights reserved.
//

import Foundation

struct PodcastViewModel {
    
    let podcast: Podcast
    
}

extension PodcastViewModel {
    var trackName: String {
        return podcast.trackName ?? ""
    }
    var artistName: String {
        return podcast.artistName ?? ""
    }
    var podcastImage: String {
        return podcast.artworkUrl600?.toSecureHTTPS() ?? ""
    }
    var trackCount: String {
        return "\(podcast.trackCount ?? 0) Episodes"
    }
    var feedUrl: String {
        return podcast.feedUrl ?? ""
    }
}


