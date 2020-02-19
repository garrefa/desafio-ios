//
//  PullRequestInteractor.swift
//  TesteArenaFelipePerius
//
//  Created by Felipe perius on 18/02/20.
//  Copyright © 2020 Felipe Perius. All rights reserved.
//

import UIKit

protocol PullRequestListBusinessLogic {
    func fetchListPullRequest(owner:String, repository: String)
}

class PullRequestInteractor: PullRequestListBusinessLogic {
    var presenter: PullRequestPresentationLogic?
    
    func fetchListPullRequest(owner: String, repository: String) {
        self.presenter?.loadingView(isLoading:true)
        PullRequestWorker.getPullrequests(owner: owner, repository: repository) { (pullRequests, msgError) in
             self.presenter?.loadingView(isLoading:false)
             if let messsage = msgError {
                    let response = PullRequestModel.Response.init(pullRequests:nil, isError: true, messageError:messsage)
                    self.presenter?.presentPullRequests(response:response)
             } else {
                    let response = PullRequestModel.Response.init(pullRequests:pullRequests, isError:false, messageError:nil)
                    self.presenter?.presentPullRequests(response:response)
            }
        }
    }
    
}
