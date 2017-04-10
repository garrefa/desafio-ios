//
//  ListRepositoriesViewControllerInput.swift
//  desafio-ios
//
//  Created by Cicero Camargo on 08/04/17.
//  Copyright (c) 2017 Stationfy. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so you can apply
//  clean architecture to your iOS and Mac projects, see http://clean-swift.com
//

import Foundation

/// Interface provided by ListRepositoriesViewController to refresh its views on state updates
protocol ListRepositoriesViewControllerInput: class, AlertPresenter {
    
    // TODO: add documentation to the methods below
    
    func displayViewModel(_ viewModel: ListRepositories.ViewModel)
    
    func updateViewModel(with repositories: [ListRepositories.ViewModel.Repository], shouldShowLoadMore: Bool)
}
