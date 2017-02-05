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
    func existData(result:Bool)
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

            switch statusCode {
                
                case GitHubAPI.statusCodes.resultOk.rawValue:
                    
                    self.pulls.append(contentsOf: result)
                    self.controller?.hideLoading()
                    self.controller?.reloadTable()
                    self.controller?.existData(result: true)
                    break
                    
                case GitHubAPI.statusCodes.errorNetwork.rawValue:
                    
                    self.controller?.existData(result: false)
                    self.controller?.hideLoading()
                    self.controller?.showAlert(title: "No Internet Connection", message: "Make sure your device is connected to the internet.")
                    break
                    
                case GitHubAPI.statusCodes.errorServidor.rawValue:
                    
                    self.controller?.existData(result: false)
                    self.controller?.showAlert(title: "Attention", message: "Communication error with the server. Try again.")
                    break
                    
                default: break
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
