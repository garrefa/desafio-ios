//
//  APIController.swift
//
//  Created by Bruno Wide on 29/11/19.
//  Copyright © 2019 BWide. All rights reserved.
//

import Foundation

public class GithubController {
    
    private let api = APIManager.default
    
    // MARK: - Public
    
    // MARK: - Properties
    
    public typealias RepositoriesResult = (Result<RepositoriesResponse>) -> Void
    public typealias PullRequestsResult = (Result<[PullRequest]>) -> Void
    public typealias VoidResult = (Result<Void>) -> Void
    public typealias UserResult = (Result<User>) -> Void
    
    public init() { }
    
    // MARK: - Methods
    
    /**
      - SeeAlso: https://developer.github.com/v3/search
      - Parameters:
        - query:search keywords
        - sort: Sorts the results of your query by when the label was created or updated.
        - order: Determines whether the first search result returned is the highest number of matches (desc) or lowest number of matches (asc). This parameter is ignored unless you provide sort.
    */
    public func searchRepositories(query: String, sort: Sort? = nil, page: Int = 1, order: Order = .descending,
                                   completion: @escaping RepositoriesResult) {
        let request = SearchRepositoriesRequest(query: query, sort: sort, order: order, page: "\(page)")
        api.perform(request, completion: completion)
    }
    
    /// - Parameters:
    ///     - owner: Repository's owner
    ///     - name: Repository's name
    public func repositoryPullRequests(owner: String, name: String, completion: @escaping PullRequestsResult) {
        let request = RepositoryPullRequestsRequest(owner: owner, name: name)
        api.perform(request, completion: completion)
    }
    
    public func user(from userLight: UserLight, completion: @escaping UserResult) {
        let request = UserRequest(userLight: userLight)
        api.perform(request, completion: completion)
    }
}
