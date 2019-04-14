//
//  PodcastCell.swift
//  Podcasts
//
//  Created by Romelys Rivero on 4/6/19.
//  Copyright © 2019 Angel Rivero. All rights reserved.
//

import UIKit
import SDWebImage

class PodcastCell: UITableViewCell {

    @IBOutlet weak var podcastImage: UIImageView!
    @IBOutlet weak var trackName: UILabel!
    @IBOutlet weak var artistName: UILabel!
    @IBOutlet weak var episodeCount: UILabel!
    
    var podcast: Podcast! {
        didSet {
            trackName.text = podcast.trackName
            artistName.text = podcast.artistName
            episodeCount.text = "\(podcast.trackCount ?? 0) Episodes"
            
            guard let url = URL(string: podcast.artworkUrl600?.toSecureHTTPS() ?? "") else {return}
            podcastImage.sd_setImage(with: url, completed: nil)
        }
    }
}
