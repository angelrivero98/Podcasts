//
//  String.swift
//  Podcasts
//
//  Created by Romelys Rivero on 4/14/19.
//  Copyright © 2019 Angel Rivero. All rights reserved.
//

import Foundation

extension String {
    func toSecureHTTPS() -> String {
        return self.contains("https") ? self : self.replacingOccurrences(of: "http", with: "https")
    }
}
