//
//  DetailViewModel.swift
//  Test
//
//  Created by Bruno Wide on 21/12/19.
//  Copyright © 2019 BWide. All rights reserved.
//

import Foundation
import APIKit

final class DetailViewModel: TableViewModel<PullRequest> {
    
    private let controller = GithubController()
    
    var repository: Repository
    
    var screenTitle: String {
        return repository.name ?? Text.noTitle
    }
    
    // MARK: - Overrides
    override func registerCells() {
        super.registerCells()
        register(PullRequestCell.self)
    }
    
    override func cellIdentifier(for indexPath: IndexPath) -> String {
        return PullRequestCell.identifier
    }
    
    override func configure(_ cell: TestTableViewCell, with item: PullRequest?) {
        guard let cell = cell as? PullRequestCell else { fatalError("") }
        guard let pr = item else { return }
        cell.pullRequest = pr
    }
    
    // MARK: - Initializer
    init(repository: Repository) {
        self.repository = repository
        super.init()
        loadPullRequests()
    }
    
    // MARK: - Private
    private func loadPullRequests() {
         guard let owner = repository.owner?.login,
             let name = repository.name else {
                 return //TODO display alert
         }

         controller.repositoryPullRequests(owner: owner, name: name)  { [weak self] result in
             switch result {
             case let .success(pullRequests):
                 self?.insert(elements: pullRequests, in: 0)
             case let .failure(error):
                 print(error)
            }
        }
    }
}
