//
//  EpisodeListViewModel.swift
//  Podcasts
//
//  Created by Romelys Rivero on 9/20/19.
//  Copyright © 2019 Angel Rivero. All rights reserved.
//

import Foundation

class EpisodeListViewModel {
    
    var episodesViewModel = [EpisodeViewModel]()
    
    func episodeAtIndex(_ index: Int) -> EpisodeViewModel {
        return episodesViewModel[index]
    }
    
    func episodesCount() -> Int {
        return episodesViewModel.count
    }
}
