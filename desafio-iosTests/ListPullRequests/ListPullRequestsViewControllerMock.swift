//
//  ListPullRequestsViewControllerMock.swift
//  desafio-ios
//
//  Created by Cicero Camargo on 10/04/17.
//  Copyright © 2017 Stationfy. All rights reserved.
//

import Foundation
@testable import desafio_ios

class ListPullRequestsViewControllerMock: AlertPresenterMock, ListPullRequestsViewControllerInput {
    
    var displayPullRequestsCountText_latestText: NSAttributedString?
    func displayPullRequestsCountText(_ text: NSAttributedString) {
        displayPullRequestsCountText_latestText = text
    }
    
    var viewModelDisplayed: ListPullRequests.ViewModel?
    func displayViewModel(_ viewModel: ListPullRequests.ViewModel) {
        viewModelDisplayed = viewModel
    }
    
    var updateViewModel_result: (pullRequests: [ListPullRequests.ViewModel.PullRequest], shouldShowLoadMore: Bool)?
    func updateViewModel(with pullRequests: [ListPullRequests.ViewModel.PullRequest], shouldShowLoadMore: Bool) {
        updateViewModel_result = (pullRequests: pullRequests, shouldShowLoadMore: shouldShowLoadMore)
    }
}
