//
//  PullRequest.swift
//  desafio-ios
//
//  Created by Cicero Camargo on 09/04/17.
//  Copyright © 2017 Stationfy. All rights reserved.
//

import Foundation

struct PullRequest {
    
    static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        return formatter
    }()
    
    enum State: String {
        case open
        case closed
    }
    
    let state: State
    let title: String
    let body: String?
    let createdAt: Date
    let htmlURL: URL
    let author: User
    
    init?(dictionary: [String: Any]) {
        guard
            let rawState = dictionary["state"] as? String,
            let state = State(rawValue: rawState),
            let title = dictionary["title"] as? String,
            let createdAt = PullRequest.dateFormatter.date(from: dictionary["created_at"] as? String ?? ""),
            let htmlURL = URL(string: dictionary["html_url"] as? String ?? ""),
            let author = User(dictionary: dictionary["user"] as? [String: Any] ?? [:])
        else {
            debugPrint("Can't parse PullRequest from dictionary: \(dictionary)")
            return nil
        }
        
        self.state = state
        self.title = title
        self.createdAt = createdAt
        self.htmlURL = htmlURL
        self.author = author
        body = dictionary["body"] as? String
    }
}
