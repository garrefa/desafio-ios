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
    static func fake() -> Repository {
        return Repository(dictionary: ["name": "",
                                       "forks_count": 0,
                                       "stargazers_count": 0,
                                       "owner": ["login": "asdf"]])!
    }
}

extension Repository: Equatable {
    public static func ==(lhs: Repository, rhs: Repository) -> Bool {
        return "\(lhs)" == "\(rhs)"
    }
}
