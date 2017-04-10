//
//  ListRepositoriesPresenterMock.swift
//  desafio-ios
//
//  Created by Cicero Camargo on 08/04/17.
//  Copyright © 2017 Stationfy. All rights reserved.
//

import Foundation
@testable import desafio_ios

class ListRepositoriesPresenterMock: ListRepositoriesPresenter {
    
    var latestDataReceivedOnPresentRepositories: (repositories: [Repository], shouldAppend: Bool, hasMore: Bool)?
    func presentRepositories(_ repositories: [Repository], shouldAppend: Bool, hasMore: Bool) {
        latestDataReceivedOnPresentRepositories = (repositories: repositories, shouldAppend: shouldAppend, hasMore: hasMore)
    }
    
    var presentRequestErrorWasCalled = false
    func presentRequestError(_ error: Error) {
        presentRequestErrorWasCalled = true
    }
}
