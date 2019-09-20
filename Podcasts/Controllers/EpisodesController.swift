//
//  EpisodesController.swift
//  Podcasts
//
//  Created by Romelys Rivero on 4/7/19.
//  Copyright © 2019 Angel Rivero. All rights reserved.
//

import UIKit
import FeedKit

class EpisodesController: UITableViewController {

    var podcastVM: PodcastViewModel? {
        didSet {
            navigationItem.title = podcastVM?.trackName
            fetchEpisodes()
        }
    }
    var episodeListViewModel = EpisodeListViewModel()
    
    private func fetchEpisodes() {
        guard let feedUrl = podcastVM?.feedUrl else {return}
        APIService.shared.fetchEpisodes(feedUrl: feedUrl) { (episodes) in
            self.episodeListViewModel.episodesViewModel = episodes.map(EpisodeViewModel.init)
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    private var cellId = "cellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    //MARK:- Setup
    private func setupTableView() {
        let nib = UINib(nibName: "EpisodeCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: cellId)
        tableView.tableFooterView = UIView()
    }
    
    //MARK:- TableView Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let episodeVM = episodeListViewModel.episodeAtIndex(indexPath.row)

        let window = UIApplication.shared.keyWindow
        let playerDetailsView = Bundle.main.loadNibNamed("PlayerDetails", owner: self, options: nil)?.first as! PlayerDetails
        playerDetailsView.frame = self.view.frame
        playerDetailsView.episodeVM = episodeVM
        window?.addSubview(playerDetailsView)

    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return episodeListViewModel.episodesCount()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! EpisodeCell
        let episodeVM = episodeListViewModel.episodeAtIndex(indexPath.row)
        cell.episodeVM = episodeVM
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 134
    }
}

