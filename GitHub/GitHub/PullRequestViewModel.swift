//
//  PullRequestViewModel.swift
//  GitHub
//
//  Created by Juliana Lacerda on 04/02/17.
//  Copyright © 2017 Juliana Lacerda. All rights reserved.
//

import Foundation

protocol PullRequestProtocol: class, ControllersProtocol {
    func reloadTable()
}

class PullRequestViewModel {
    
    weak var controller: PullRequestProtocol?
    
    func assignController(controller: PullRequestProtocol) {
        self.controller = controller
    }
    
    var pulls = [PullRequestEntidy]()
    
    internal func requestPullRequests(url: String) {
        
        self.controller?.showLoading()
        GitHubAPI.getPullRequests(url: url, handler: { (statusCode, result) in

            if statusCode {
                self.pulls.append(contentsOf: result)
                self.controller?.hideLoading()
                self.controller?.reloadTable()
                
            } else {
                self.controller?.showAlert(message: "Error! Try again.")
            }
            
        })
    }
    
    internal func getPullsOpened() -> String {
        
        var totalOpen = 0
        
        for pull in pulls {
            
            if pull.state == "open" {
                totalOpen += 1
            }
        }
        
        return "\(totalOpen) opened"
    }
    
    internal func getPullsClosed() -> String {
        
        var totalClosed = 0
        
        for pull in pulls {
            
            if pull.state == "closed" {
                totalClosed += 1
            }
        }
        
        return "/ \(totalClosed) closed"
    }
}
