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
    
    var latestDataReceivedOnReloadRepositories: (repositories: [Repository], hasMore: Bool)?
    func reloadRepositories(_ repositories: [Repository], hasMore: Bool) {
        latestDataReceivedOnReloadRepositories = (repositories: repositories, hasMore: hasMore)
    }
    
    var latestDataReceivedOnAppendRepositories: (repositories: [Repository], hasMore: Bool)?
    func appendRepositories(_ repositories: [Repository], hasMore: Bool) {
        latestDataReceivedOnAppendRepositories = (repositories: repositories, hasMore: hasMore)
    }
    
    var presentRequestErrorWasCalled = false
    func presentRequestError() {
        presentRequestErrorWasCalled = true
    }
}
