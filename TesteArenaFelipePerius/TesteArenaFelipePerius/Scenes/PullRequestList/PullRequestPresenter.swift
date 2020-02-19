//
//  PullRequestPresenter.swift
//  TesteArenaFelipePerius
//
//  Created by Felipe perius on 18/02/20.
//  Copyright © 2020 Felipe Perius. All rights reserved.
//

import UIKit

protocol PullRequestPresentationLogic {
    func presentPullRequests(response:PullRequestModel.Response)
    func loadingView(isLoading:Bool)
}

class PullRequestPresenter: PullRequestPresentationLogic {
    weak var viewController: PullRequestOutput?
    
    func presentPullRequests(response: PullRequestModel.Response) {
        viewController?.displayPullRequests(viewModel:response)
    }
    
    func loadingView(isLoading: Bool) {
        viewController?.loadingView(isLoading:isLoading)
    }
    
}
