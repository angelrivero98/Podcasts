//
//  EpisodeViewModel.swift
//  Podcasts
//
//  Created by Romelys Rivero on 9/20/19.
//  Copyright © 2019 Angel Rivero. All rights reserved.
//

import Foundation

struct EpisodeViewModel {
    let episode: Episode
}

extension EpisodeViewModel {
    var title: String {
        return episode.title
    }
    
    var pubDate: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM dd, yyyy"
        return dateFormatter.string(from: episode.pubDate)
    }
    
    var description: String {
        return episode.description
    }
    
    var author: String {
        return episode.author
    }
    
    var streamUrl: String {
        return episode.streamUrl
    }
    
    var imageUrl: String {
        return episode.imageUrl?.toSecureHTTPS() ?? ""
    }
}
