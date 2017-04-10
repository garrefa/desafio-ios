//
//  ListRepositoriesViewControllerMock.swift
//  desafio-ios
//
//  Created by Cicero Camargo on 08/04/17.
//  Copyright © 2017 Stationfy. All rights reserved.
//

import Foundation
@testable import desafio_ios

class ListRepositoriesViewControllerMock: AlertPresenterMock, ListRepositoriesViewControllerInput {

    var latestViewModelDisplayed: ListRepositories.ViewModel?
    func displayViewModel(_ viewModel: ListRepositories.ViewModel) {
        latestViewModelDisplayed = viewModel
    }
    
    var latestUpdateViewModelData: (repositories: [ListRepositories.ViewModel.Repository], shouldShowLoadMore: Bool)?
    func updateViewModel(with repositories: [ListRepositories.ViewModel.Repository], shouldShowLoadMore: Bool) {
        latestUpdateViewModelData = (repositories: repositories, shouldShowLoadMore: shouldShowLoadMore)
    }
}
