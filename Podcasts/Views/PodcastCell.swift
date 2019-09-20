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
    
    var podcastViewModel: PodcastViewModel! {
        didSet {
            trackName.text = podcastViewModel.trackName
            artistName.text = podcastViewModel.artistName
            episodeCount.text = podcastViewModel.trackCount
            
            guard let url = URL(string: podcastViewModel.podcastImage) else {return}
            podcastImage.sd_setImage(with: url, completed: nil)
        }
    }
}
