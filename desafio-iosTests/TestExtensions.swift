//
//  TestExtensions.swift
//  desafio-ios
//
//  Created by Cicero Camargo on 08/04/17.
//  Copyright © 2017 Stationfy. All rights reserved.
//

import Foundation
@testable import desafio_ios

extension Repository {
    static func example() -> Repository {
        return Repository(dictionary: repositoryExampleJSON())!
    }
}

func repositoryExampleJSON() -> [String: Any] {
    return loadJSONFile("RepositoryExample")
}

extension Repository: Equatable {
    public static func ==(lhs: Repository, rhs: Repository) -> Bool {
        return "\(lhs)" == "\(rhs)"
    }
}

extension PullRequest {
    static func example() -> PullRequest {
        return PullRequest(dictionary: pullRequestExampleJSON())!
    }
}

func pullRequestExampleJSON() -> [String: Any] {
    return loadJSONFile("PullRequestExample")
}

extension PullRequest: Equatable {
    public static func ==(lhs: PullRequest, rhs: PullRequest) -> Bool {
        return "\(lhs)" == "\(rhs)"
    }
}


fileprivate func loadJSONFile(_ fileName: String) -> [String: Any] {
    let bundle = Bundle(for: RepositoryServiceMock.self)
    let fileURL = bundle.url(forResource: fileName, withExtension: "json")!
    let data = try! Data(contentsOf: fileURL)
    return try! JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [String: Any]
}

func anyError() -> Error {
    return NSError(domain: "", code: 0, userInfo: .none)
}
