//
//  PullRequestSingleton.swift
//  Challenge
//
//  Created by Gustavo Henrique on 16/04/17.
//  Copyright © 2017 Gustavo Henrique. All rights reserved.
//

import UIKit

class PullRequestSingleton: NSObject {

    static let sharedInstance = PullRequestSingleton()
    var requests : [PullRequest] = [PullRequest]()
    var repository : Repository
    
    private override init() {
        self.repository = Repository()
        super.init()
    }
    
    func getRepository() -> Repository {
        return self.repository
    }
    
    func setRepository(newRepository: Repository) {
        self.repository = newRepository
    }
    
    func getRequestList() -> [PullRequest] {
        return self.requests
    }
    
    func addPullRequest(newRequest: PullRequest) {
        self.requests.append(newRequest)
    }
    
    func fetchRequests(completionHandler completion: @escaping()->Void) {
        
        self.requests.removeAll()
        PullRequestHandler.requestsFrom(login: self.repository.owner.login, name: self.repository.name){ (result: [PullRequest]) in
            if result.count > 0 {
                
                for request in result {
                    self.requests.append(request)
                }
                completion()
            }
        }
    }
    
}
