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

    let baseURL = URL(string: "https://api.github.com")!
    
    func findRepositories(language: ProgrammingLanguage,
                          sortBy sortMethod: SortMethod?,
                          page: UInt,
                          onCompletion completionBlock: @escaping ([Repository], Bool) -> Void,
                          onError errorBlock: @escaping (Error) -> Void) {
        
        // TODO: verify connection before
        
        // setup url
        let url = baseURL.appendingPathComponent("search").appendingPathComponent("repositories")
        
        // setup parameters
        var params: Parameters = [:]
        params["q"] = "language:\(language.githubAPIValue)"
        params["page"] = adjustPageIndex(page)
        if let sortMethod = sortMethod {
            params["sort"] = sortMethod.key.githubAPIValue
            params["order"] = sortMethod.direction.githubAPIValue
        }
        
        // make the request
        _ = Alamofire.request(url, method: .get, parameters: params, encoding: URLEncoding.default) .responseJSON { response in
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
                
                // discover if there are more pages
                guard let linkHeaderValue = response.response?.allHeaderFields["Link"] as? String else {
                    errorBlock(RepositoryServiceError.unableToParseHeaders)
                    return
                }
                let hasMorePages = linkHeaderValue.contains("rel=\"next\"")
                
                completionBlock(repositories, hasMorePages)
            }
        }
    }
    
    /// Page indexes in the Github API are 1-based
    private func adjustPageIndex(_ page: UInt) -> UInt { return page + 1 }
}

extension ProgrammingLanguage {
    var githubAPIValue: String {
        switch self {
        case .java:
            return "Java"
        }
    }
}

extension SortKey {
    var githubAPIValue: String {
        switch self {
        case .stars:
            return "stars"
        case .forks:
            return "forks"
        case .updated:
            return "udpated"
        }
    }
}

extension SortDirection {
    var githubAPIValue: String {
        switch self {
        case .ascending:
            return "asc"
        case .descending:
            return "desc"
        }
    }
}
