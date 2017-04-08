//
//  DefaultListRepositoriesPresenter.swift
//  desafio-ios
//
//  Created by Cicero Camargo on 08/04/17.
//  Copyright (c) 2017 Stationfy. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so you can apply
//  clean architecture to your iOS and Mac projects, see http://clean-swift.com
//

import Foundation

/// Prepares data for presentation in ListRepositoriesViewController
class DefaultListRepositoriesPresenter: ListRepositoriesPresenter {
	
	weak var viewController: ListRepositoriesViewControllerInput!
  
	// MARK: - Presentation logic
    
    func reloadRepositories(_ repositories: [Repository], hasMore: Bool) {
    
    }
    
    func appendRepositories(_ repositories: [Repository], hasMore: Bool) {
    
    }
    
    func presentRequestError() {
    
    }
}
