//
//  Podcast.swift
//  Podcasts
//
//  Created by Romelys Rivero on 4/2/19.
//  Copyright © 2019 Angel Rivero. All rights reserved.
//

import Foundation

struct Podcast: Decodable {
    var trackName: String?
    var artistName: String?
    var artworkUrl600: String?
    var trackCount: Int?
    var feedUrl: String?
}
