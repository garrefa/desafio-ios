//
//  DefaultListRepositoriesInteractor.swift
//  desafio-ios
//
//  Created by Cicero Camargo on 08/04/17.
//  Copyright (c) 2017 Stationfy. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so you can apply
//  clean architecture to your iOS and Mac projects, see http://clean-swift.com
//

import Foundation

/// Implements the business logic behind the events that come from ListRepositoriesViewController
class DefaultListRepositoriesInteractor: ListRepositoriesInteractor {

    var presenter: ListRepositoriesPresenter!
    
    private let repositoryService: RepositoryService
    
    /// We use a semaphore to guarantee that we only have 1 request at a time and we don't messing up with the page index
    private let semaphore = DispatchSemaphore(value: 1)
    
    private var nextPage: UInt = 0
    
    init(repositoryService: RepositoryService) {
        self.repositoryService = repositoryService
    }
    
    // MARK: - Business logic
    
    func loadInitialRepositories() {
        nextPage = 0
        findRepositories(
            language: .java,
            sortBy: SortMethod(key: .stars, direction: .descending),
            page: nextPage,
            onCompletion: { repositories, hasMorePages in
                nextPage += 1
                presenter.reloadRepositories(repositories, hasMore: hasMorePages)
            },
            onError: { error in
                presenter.presentRequestError()
            }
        )
    }
    
    func loadMoreRepositories() {
        guard nextPage > 0 else {
            debugPrint("Warning: trying to load more repos when `nextPage` is 0.")
            loadInitialRepositories()
            return
        }
        
        findRepositories(
            language: .java,
            sortBy: SortMethod(key: .stars, direction: .descending),
            page: nextPage,
            onCompletion: { repositories, hasMorePages in
                nextPage += 1
                presenter.appendRepositories(repositories, hasMore: hasMorePages)
            },
            onError: { error in
                presenter.presentRequestError()
            }
        )
    }
    
    // a private `findRepositories` which just forwards the request to `repositoryService` making sure that we don't 
    // have concurrent requests
    private func findRepositories(language: ProgrammingLanguage,
                                  sortBy sortMethod: SortMethod?,
                                  page: UInt,
                                  onCompletion completionBlock: ([Repository], Bool) -> Void,
                                  onError errorBlock: (Error) -> Void) {
        semaphore.wait()
        repositoryService.findRepositories(
            language: .java,
            sortBy: SortMethod(key: .stars, direction: .descending),
            page: page,
            onCompletion: { repositories, hasMorePages in
                completionBlock(repositories, hasMorePages)
                semaphore.signal()
            },
            onError: { error in
                errorBlock(error)
                semaphore.signal()
            }
        )
    }
}
