//
//  EpisodeCell.swift
//  Podcasts
//
//  Created by Romelys Rivero on 4/9/19.
//  Copyright © 2019 Angel Rivero. All rights reserved.
//

import UIKit

class EpisodeCell: UITableViewCell {

    var episodeVM: EpisodeViewModel! {
        didSet {
            titleLabel.text = episodeVM.title
            descriptionLabel.text = episodeVM.description
            pubDateLabel.text = episodeVM.pubDate
            let url = URL(string: episodeVM.imageUrl)
            episodeImageView.sd_setImage(with: url)
        }
    }
    
    @IBOutlet weak var episodeImageView: UIImageView!
    @IBOutlet weak var pubDateLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
}
