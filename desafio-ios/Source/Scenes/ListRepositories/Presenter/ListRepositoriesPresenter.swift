//
//  ListRepositoriesPresenter.swift
//  desafio-ios
//
//  Created by Cicero Camargo on 08/04/17.
//  Copyright (c) 2017 Stationfy. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so you can apply
//  clean architecture to your iOS and Mac projects, see http://clean-swift.com
//

import Foundation

/// Interface provided by a ListRepositoriesPresenter to receive inputs from a Interactor
protocol ListRepositoriesPresenter {
    
    /// function called to refresh the repositories to be presented
    func reloadRepositories(_ repositories: [Repository], hasMore: Bool)
    
    /// function called to add items to the previously presented ones
    func appendRepositories(_ repositories: [Repository], hasMore: Bool)
    
    /// function called to present a request error
    func presentRequestError()
}
