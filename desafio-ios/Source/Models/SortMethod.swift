//
//  SortMethod.swift
//  desafio-ios
//
//  Created by Cicero Camargo on 08/04/17.
//  Copyright © 2017 Stationfy. All rights reserved.
//

import Foundation

enum SortKey {
    case stars
}

enum SortDirection {
    case ascending
    case descending
}

struct SortMethod {
    let key: SortKey
    let direction: SortDirection
}
