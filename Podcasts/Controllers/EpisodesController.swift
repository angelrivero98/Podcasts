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

    var podcast: Podcast? {
        didSet {
            navigationItem.title = podcast?.trackName
            fetchEpisodes()
        }
    }
    var episodes = [Episode]()
    
    private func fetchEpisodes() {
        guard let feedUrl = podcast?.feedUrl else {return}
        
        let securedUrl = feedUrl.contains("https") ? feedUrl : feedUrl.replacingOccurrences(of: "http", with: "https")
        guard let url = URL(string: securedUrl) else {return}
        let parser = FeedParser(URL: url)
        parser.parseAsync { (result) in
            switch result {
            case let .rss(feed):
                var episodes = [Episode]()
                feed.items?.forEach({ (item) in
                    let episode = Episode(title: item.title ?? "")
                    episodes.append(episode)
                })
                self.episodes = episodes
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                break
            case let .failure(error):
                print("Failed to parse feed: ", error)
                break
            default:
                break
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
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        tableView.tableFooterView = UIView()
    }
    
    //MARK:- TableView Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return episodes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        let episode = episodes[indexPath.row]
        cell.textLabel?.text = episode.title
        return cell
    }
}

struct Episode {
    let title: String
}
