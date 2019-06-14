//
//  PlayerDetails.swift
//  Podcasts
//
//  Created by Romelys Rivero on 4/14/19.
//  Copyright © 2019 Angel Rivero. All rights reserved.
//

import UIKit

class PlayerDetails: UIView {
    
    var episode: Episode! {
        didSet {
            episodeTitleLabel.text = episode.title
            authorLabel.text = episode.author
            guard let url = URL(string: episode.imageUrl?.toSecureHTTPS() ?? "") else { return }
            episodeImageView.sd_setImage(with: url)
        }
    }
    
    @IBAction func handleDismiss(_ sender: Any) {
        self.removeFromSuperview()
    }
    @IBOutlet weak var episodeImageView: UIImageView!
    @IBOutlet weak var episodeTitleLabel: UILabel!{
        didSet{
            episodeTitleLabel.numberOfLines = 2
        }
    }
    @IBOutlet weak var authorLabel: UILabel!
    
    @IBOutlet weak var playPauseButton: UIButton!
    
}
