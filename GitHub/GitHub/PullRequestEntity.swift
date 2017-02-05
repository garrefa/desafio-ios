//
//  PullRequestEntity.swift
//  GitHub
//
//  Created by Juliana Lacerda on 03/02/17.
//  Copyright © 2017 Juliana Lacerda. All rights reserved.
//

import Foundation
import SwiftyJSON

class PullRequestEntidy: NSObject {
    
    var pullRequestId: Int
    var title: String
    var body: String?
    
    var user: OwnerEntidy?
    
    var htmlUrl: URL?
    var state: String
    
    var createdDate: Date?
    var createdDateString: String {
        get {
            let dayTimeFormatter = DateFormatter()
            
            dayTimeFormatter.dateFormat = "dd/MM/yyyy"
            return dayTimeFormatter.string(from: self.createdDate! as Date)
        }
    }
    
    init(rawData: JSON) {
        
        self.pullRequestId = rawData["id"].int!
        
        self.title = rawData["title"].string!
        self.body = rawData["body"].string!
        
        if (rawData["user"] != JSON.null) {
            self.user = OwnerEntidy(rawData: rawData["user"])
        }
        
        self.state = rawData["state"].string!
        
        let url = rawData["html_url"].string!
        self.htmlUrl = URL(string: url)
        
        
        //get date and format
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        
        self.createdDate = dateFormater.date(from: rawData["created_at"].string!)
    }
}
