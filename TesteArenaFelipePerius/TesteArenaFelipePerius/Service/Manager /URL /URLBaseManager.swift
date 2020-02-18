//
//  URLBaseManager.swift
//  TesteArenaFelipePerius
//
//  Created by Felipe perius on 17/02/20.
//  Copyright © 2020 Felipe Perius. All rights reserved.
//

import UIKit

class URLBaseManager: NSObject {
    static let serviceDomain: String = "https://api.github.com/"
     
    class var baseURL: URL {
         return URL(string: "\(serviceDomain)")!
    }
    
    static func queryURL(queryParam query: String) -> URL? {

        guard let url = URL(string: "\(serviceDomain)\(query)") else {
            return nil
        }
        return url
    }
}
