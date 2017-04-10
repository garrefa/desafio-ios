//
//  RepositoryServiceParameters.swift
//  desafio-ios
//
//  Created by Cicero Camargo on 08/04/17.
//  Copyright © 2017 Stationfy. All rights reserved.
//

import Foundation

enum RepositoriesSortKey: String {
    case stars
    case forks
    case updated
}

enum PullRequestsSortKey: String {
    case created
    case updated
    case popularity
    case longRunning = "long-running"
}

enum PullRequestsStateFilter: String {
    case open
    case closed
    case all
}

enum SortDirection: String {
    case ascending = "asc"
    case descending = "desc"
}

struct SortMethod<SortKey: RawRepresentable> {
    let key: SortKey
    let direction: SortDirection
}
