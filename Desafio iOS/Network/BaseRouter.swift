//
//  BaseRouter.swift
//  Sambonde
//
//  Created by João Pedro Souza on 22/01/17.
//  Copyright © 2017 Souza. All rights reserved.
//

import Foundation
import Alamofire

let baseURL = "https://api.github.com"


public typealias JSONDictionary = [String: AnyObject]
typealias APIParams = [String : AnyObject]?

protocol APIConfiguration {
  var method: Alamofire.HTTPMethod { get }
  var encoding: Alamofire.ParameterEncoding? { get }
  var path: String { get }
  var parameters: APIParams { get }
  var baseUrl: String { get }
}

class BaseRouter : URLRequestConvertible, APIConfiguration {
  init() {}
  
  public func asURLRequest() throws -> URLRequest {
    let baseURL = URL(string: baseUrl)
    var mutableURLRequest = URLRequest(url: baseURL!.appendingPathComponent(path))
    mutableURLRequest.httpMethod = method.rawValue

    if let encoding = encoding {
      return try encoding.encode(mutableURLRequest, with: parameters)
    }
    
    return mutableURLRequest as URLRequest
  }
  
  var method: Alamofire.HTTPMethod {
    fatalError("\(#function))] Must be overridden in subclass")
  }
  
  var encoding: Alamofire.ParameterEncoding? {
    fatalError("\(#function))] Must be overridden in subclass")
  }
  
  var path: String {
    fatalError("\(#function))] Must be overridden in subclass")
  }
  
  var parameters: APIParams {
    fatalError("\(#function))] Must be overridden in subclass")
  }
  
  var baseUrl: String {
    return baseURL
  }
}
