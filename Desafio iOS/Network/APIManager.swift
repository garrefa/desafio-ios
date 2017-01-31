//
//  APIManager.swift
//  Sambonde
//
//  Created by João Pedro Souza on 22/01/17.
//  Copyright © 2017 Souza. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper

typealias ResponseBlockWithError = (NSError?) -> Void
typealias ResponseBlock = (Any?, NSError?) -> Void

class APIManager {
  
  static let shared: APIManager = APIManager()
  
  let manager = Alamofire.SessionManager.default
  
  // MARK: - Constructors
  
  private init() { }
  
  func repositories(withLanguage language: String, page: Int, completion: ResponseBlock?) {
    let router = GithubRouter(endpoint: .SearchRepositories(language: language, page: page))
    
    executeRequest(router: router) { (response, error) in
      if let error = error, let block = completion {
        block(nil, error)
      } else if let jsonRepositories = response as? [String : Any] {
        if let arrayRepositories = jsonRepositories["items"] as? [ [String : Any] ], let count = jsonRepositories["total_count"] as? Int, let block = completion {
          let repositories: [Repository] = arrayRepositories.arrayOfClass()
          let repositoryList = RepositoryList(repositories: repositories, totalCount: count)
          
          block(repositoryList, nil)
        }
      }
    }
  }
  
  func pullRequests(withRepository repository: Repository, completion: ResponseBlock?) {
    let router = GithubRouter(endpoint: .PullRequestsOfARepository(repository: repository))
    
    executeRequest(router: router) { (response, error) in
      if let error = error, let block = completion {
        block(nil, error)
      } else if let arrayPullRequests = response as? [ [String: Any] ], let block = completion {
        let pullRequests: [PullRequest] = arrayPullRequests.arrayOfClass()
        block(pullRequests, nil)
      }
    }
  }
  
  
  // MARK: - Private
  
  private func executeRequest(router: BaseRouter, completion: ResponseBlock?)  {
    _ = manager.request(router)
      .validate(statusCode: 200..<305)
      .responseJSON { response in
        switch response.result {
        case .success:
          if let json = response.result.value as? [String : Any], let block = completion {
            block(json, nil)
          } else if let jsonArray = response.result.value as? [ [String : Any] ], let block = completion {
            block(jsonArray, nil)
          }
          break
        case .failure:
          if let error = response.result.error as? NSError, let block = completion {
            block(nil, error)
          break
        }
      }
    }
  }
}
