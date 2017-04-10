//
//  GithubRepositoryService.swift
//  desafio-ios
//
//  Created by Cicero Camargo on 08/04/17.
//  Copyright © 2017 Stationfy. All rights reserved.
//

import Foundation
import Alamofire

/// A class that implements RepositoryService, fetching data from the Github API
class GithubRepositoryService: RepositoryService {

    static let shared = GithubRepositoryService()
    
    let baseURL = URL(string: "https://api.github.com")!
    
    // TODO: verify connection before in all requests
    
    func findRepositories(language: ProgrammingLanguage,
                          sortBy sortMethod: SortMethod<RepositoriesSortKey>?,
                          page: UInt,
                          onCompletion completionBlock: @escaping ([Repository], Bool) -> Void,
                          onError errorBlock: @escaping (Error) -> Void) {
        
        // setup url
        let url = baseURL.appendingPathComponent("search").appendingPathComponent("repositories")
        
        // setup parameters
        var params: Parameters = [:]
        params["q"] = "language:\(language.rawValue)"
        params["page"] = adjustPageIndex(page)
        if let sortMethod = sortMethod {
            params["sort"] = sortMethod.key.rawValue
            params["order"] = sortMethod.direction.rawValue
        }
        
        // make the request
        _ = Alamofire.request(url,
                              method: .get,
                              parameters: params,
                              encoding: URLEncoding.default,
                              headers: defaultHeaders()) .responseJSON { response in
                                
            switch response.result {
            
            case .failure(let error):
                errorBlock(error)
            
            case .success(let value):
                // parse repositories
                guard let JSON = value as? [String: Any], let items = JSON["items"] as? [[String: Any]] else {
                    errorBlock(RepositoryServiceError.unableToParseResponse)
                    return
                }
                let repositories = items.flatMap { Repository(dictionary: $0) }
                
                // discover if there are more pages to be requested
                guard let morePages = self.checkIfThereAreMorePages(fromLinkHeaderIn: response.response) else {
                    errorBlock(RepositoryServiceError.unableToParseHeaders)
                    return
                }
                
                completionBlock(repositories, morePages)
            }
        }
    }
    
    func pullRequests(for repository: Repository,
                      filterByState state: PullRequest.State?,
                      sortBy sortMethod: SortMethod<PullRequestsSortKey>?,
                      page: UInt,
                      onCompletion completionBlock: @escaping ([PullRequest], Bool) -> Void,
                      onError errorBlock: @escaping (Error) -> Void) {
        
        // setup url
        let url = baseURL.appendingPathComponent("repos")
            .appendingPathComponent(repository.owner.login)
            .appendingPathComponent(repository.name)
            .appendingPathComponent("pulls")
        
        // setup parameters
        var params: Parameters = [:]
        params["page"] = adjustPageIndex(page)
        params["state"] = state?.rawValue ?? "all"
        if let sortMethod = sortMethod {
            params["sort"] = sortMethod.key.rawValue
            params["direction"] = sortMethod.direction.rawValue
        }
        
        // make the request
        _ = Alamofire.request(url,
                              method: .get,
                              parameters: params,
                              encoding: URLEncoding.default,
                              headers: defaultHeaders()) .responseJSON { response in
                                
            switch response.result {
                
            case .failure(let error):
                errorBlock(error)
                
            case .success(let value):
                // parse pull requests
                guard let items = value as? [[String: Any]] else {
                    errorBlock(RepositoryServiceError.unableToParseResponse)
                    return
                }
                let pullRequests = items.flatMap { PullRequest(dictionary: $0) }
                
                // discover if there are more pages to be requested
                guard let morePages = self.checkIfThereAreMorePages(fromLinkHeaderIn: response.response) else {
                    errorBlock(RepositoryServiceError.unableToParseHeaders)
                    return
                }
                
                completionBlock(pullRequests, morePages)
            }
        }
    }
    
    func pullRequestsCount(for repository: Repository,
                           filterByState state: PullRequest.State?,
                           onCompletion completionBlock: @escaping (Int) -> Void,
                           onError errorBlock: @escaping (Error) -> Void) {
        
//        errorBlock(RepositoryServiceError.unableToParseResponse)
//        return
    
        // setup url
        let url = baseURL.appendingPathComponent("search").appendingPathComponent("issues")
        
        // setup query string
        var queryString = "?q=repo:\(repository.owner.login)/\(repository.name)+type:pr"
        if let state = state {
            queryString += "+is:\(state.rawValue)"
        }
        
        _ = Alamofire.request(url.absoluteString + queryString,
                              method: .get,
                              parameters: [:],
                              encoding: URLEncoding.default,
                              headers: defaultHeaders()).responseJSON { response in
                                
            switch response.result {
                
            case .failure(let error):
                errorBlock(error)
                
            case .success(let value):
                // parse pull requests
                guard let JSON = value as? [String: Any], let totalCount = JSON["total_count"] as? Int else {
                    errorBlock(RepositoryServiceError.unableToParseResponse)
                    return
                }
                
                completionBlock(totalCount)
            }
        }
    }
    
    // MARK: - Helper methods
    
    func defaultHeaders() -> HTTPHeaders {
        return ["Accept": "application/vnd.github.v3+json"] // forces the api to v3+json
    }
    
    func checkIfThereAreMorePages(fromLinkHeaderIn response: HTTPURLResponse?) -> Bool? {
        guard let linkHeaderValue = response?.allHeaderFields["Link"] as? String else {
            return nil
        }
        return linkHeaderValue.contains("rel=\"next\"")
    }
    
    /// Page indexes in the Github API are 1-based
    private func adjustPageIndex(_ page: UInt) -> UInt { return page + 1 }
}
