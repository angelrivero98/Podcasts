//
//  RSSFeed.swift
//  Podcasts
//
//  Created by Romelys Rivero on 4/14/19.
//  Copyright © 2019 Angel Rivero. All rights reserved.
//

import Foundation
import FeedKit

extension RSSFeed {
    func toEpisodes() -> [Episode] {
        let imageUrl = iTunes?.iTunesImage?.attributes?.href
        var episodes = [Episode]()
        items?.forEach({ (item) in
            var episode = Episode(feedItem: item)
            if episode.imageUrl == nil {
                episode.imageUrl = imageUrl
            }
            episodes.append(episode)
        })
        return episodes
    }
}
