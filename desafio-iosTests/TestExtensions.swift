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
        return Repository()
    }
}

extension Repository: Equatable {
    public static func ==(lhs: Repository, rhs: Repository) -> Bool {
        return "\(lhs)" == "\(rhs)"
    }
}
