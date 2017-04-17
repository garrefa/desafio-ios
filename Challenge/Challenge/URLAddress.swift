//
//  URL.swift
//  Challenge
//
//  Created by Gustavo Henrique on 15/04/17.
//  Copyright © 2017 Gustavo Henrique. All rights reserved.
//


import UIKit

enum Endpoint: String {
    case repository = "/search/repositories"
    case pullRequest = "/repos"
}

enum URLAddress {
    
    case base // Base das chamadas
    case test // Teste para chamadas
    
    private func getUrl() -> String {
        switch self {
        case .base:
            return "https://api.github.com"
        case .test:
            return ""
        }
    }
    
    private static func returnURL(index: Int) -> URLAddress {
        switch index {
        case 0:
            return .base
        case 1:
            return .test
        default:
            return .test
        }
    }
    
    static func urlWithEndPoint(_ endpoint: Endpoint) -> String {
        return  self.returnURL(index:0).getUrl() + endpoint.rawValue
    }
}
