//
//  PodcastListViewModel.swift
//  Podcasts
//
//  Created by Romelys Rivero on 9/20/19.
//  Copyright © 2019 Angel Rivero. All rights reserved.
//

import Foundation

class PodcastListViewModel {
    
    var podcastsViewModel: [PodcastViewModel]
    
    init() {
        podcastsViewModel = [PodcastViewModel]()
    }
    
    func podcastAtIndex(_ index: Int) -> PodcastViewModel {
        return podcastsViewModel[index]
    }
    
    func podcastsCount() -> Int {
        return podcastsViewModel.count
    }
}
