//
//  Routes.swift
//  TesteArenaFelipePerius
//
//  Created by Felipe perius on 17/02/20.
//  Copyright © 2020 Felipe Perius. All rights reserved.
//

import UIKit

class Routes: NSObject {
    // MARK: - Search Repository
    static func getRepositories(page:Int) -> URL? {
        guard let url = URLBaseManager.queryURL(queryParam:"search/repositories?q=language:Java&sort=stars&page=\(page)") else { return nil }
        return url
    }
    
    // MARK: - PullRequests
    static func getStatements(owner: String, repository: String) -> URL {
        return  URLBaseManager.baseURL.appendingPathComponent("repos/\(owner)/\(repository)/pulls")
    }
}
