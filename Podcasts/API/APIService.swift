//
//  APIService.swift
//  Podcasts
//
//  Created by Romelys Rivero on 4/6/19.
//  Copyright © 2019 Angel Rivero. All rights reserved.
//

import Foundation
import Alamofire

class APIService {
    
    static let shared = APIService()
    let url = "https://itunes.apple.com/search"
    
    func fetchPodcasts(searchText: String, completionHnadler: @escaping ([Podcast]) -> ()) {
        let parameters = ["term": searchText, "media": "podcast"]
        
        AF.request(url, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: nil).responseData { (dataResponse) in
            if let err = dataResponse.error {
                print(err)
                return
            }
            guard let data = dataResponse.data else {return}
            
            do {
                let searchResults = try JSONDecoder().decode(SearchResults.self, from: data)
                completionHnadler(searchResults.results)
            } catch let decodeErr {
                print("Failed to decode", decodeErr)
            }
            
        }
    }
}

struct SearchResults: Decodable {
    let resultCount: Int
    let results: [Podcast]
    
}
