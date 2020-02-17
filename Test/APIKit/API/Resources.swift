//
//  Resources.swift
//  APIKit
//
//  Created by Bruno Wide on 16/02/20.
//  Copyright © 2020 BWide. All rights reserved.
//

import Foundation
import Alamofire

public enum Result<Value> {
    case success(Value)
    case failure(Error)
}

/// Implemented by requests that don't return any objects
public protocol RequestNoReturn {
    var path: String { get }
    var method: HTTPMethod { get }
    var body: [String: String]? { get }
}

/// implemented by requests that have a return type
/// - Important: `ReturnType` must conform to `Decodable`
public protocol Request: RequestNoReturn {
    associatedtype ReturnType: Decodable
}

class ObjectNotDecoded: Error {
    var message: String
    
    init(message: String) {
        self.message = message
    }
}

class EventNotFound: Error { }
class NoResponseData: Error { }
class EventNotFoundError: Error { }

public enum Sort: String {
    case stars = "stars"
    case forks = "forks"
    case helpWantedIssues = "help-wanted-issues"
    case updated = "updates"
}

public enum Order: String {
    case ascending = "asc"
    case descending = "desc"
}

