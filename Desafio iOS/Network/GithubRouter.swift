//
//  GithubRouter.swift
//  Desafio iOS
//
//  Created by João Pedro Souza on 30/01/17.
//  Copyright © 2017 Arena. All rights reserved.
//

import Foundation
import Alamofire

enum GithubEndpoint {
  case SearchRepositories(language: String, page: Int)
  case PullRequestsOfARepository(repository: Repository)
}

class GithubRouter: BaseRouter {
  
  var endpoint: GithubEndpoint
  
  init(endpoint: GithubEndpoint) {
    self.endpoint = endpoint
  }
  
  override var method: Alamofire.HTTPMethod {
    switch endpoint {
      case .SearchRepositories: return .get
      case .PullRequestsOfARepository: return .get
    }
  }
  
  override var path: String {
    switch endpoint {
      case .SearchRepositories: return "search/repositories"
      case .PullRequestsOfARepository(let repository): return "repos/\(repository.owner.login!)/\(repository.name!)/pulls"
    }
  }
  
  override var parameters: APIParams {
    switch endpoint {
      case .SearchRepositories(let language, let page):
        return ["q" : "language:\(language)" as AnyObject, "sort" : "stars" as AnyObject, "page" : page as AnyObject]
      case .PullRequestsOfARepository:
        return [ "state" : "all" as AnyObject]
      default: return nil
    }
  }
  
  override var encoding: Alamofire.ParameterEncoding? {
    switch endpoint {
      case .SearchRepositories: return URLEncoding()
      case .PullRequestsOfARepository: return URLEncoding()
      default: return JSONEncoding()
    }
  }
  
}
