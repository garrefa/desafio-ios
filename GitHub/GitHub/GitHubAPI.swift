//
//  GitHubAPI.swift
//  GitHub
//
//  Created by Juliana Lacerda on 04/02/17.
//  Copyright © 2017 Juliana Lacerda. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class GitHubAPI {
    
    enum urlsAPI: String {
        case urlBase = "https://api.github.com"
        case urlSearchRepositories = "https://api.github.com/search/repositories"
    }
    
    enum statusCodes: Int {
        case errorNetwork = 2
        case errorServidor = 3
        case resultOk = 4
    }
    
    class func getRepositories(page: Int, language: String, sort: String, handler: @escaping (_ statusCode: Int, _ result:[RepositoryEntity])->Void) {
        
        guard Reachability.isConnectedToNetwork() else {
            handler(statusCodes.errorNetwork.rawValue, [])
            return
        }
        
        let url = urlsAPI.urlSearchRepositories.rawValue + "?q=language:\(language)&sort=\(sort)&page=\(page)"
        
        Alamofire.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil).responseJSON { (response:DataResponse<Any>) in
            
            switch(response.result) {
            case .success(_):
                if let data = response.result.value{
                    
                    var repositories = [RepositoryEntity]()
                    let json = JSON(data)

                    for (_,subJson) in json["items"] {
                        repositories.append(RepositoryEntity(rawData: subJson))
                    }
                    
                    handler(statusCodes.resultOk.rawValue, repositories)
                }
                break
                
            case .failure(_):
                handler(statusCodes.errorServidor.rawValue, [])
                break
                
            }
            
        }
    }
    
    class func getFullNameOwner(url: String, handler: @escaping (_ statusCode: Int, _ result: [OwnerEntidy])->Void) {
        
        guard Reachability.isConnectedToNetwork() else {
            handler(statusCodes.errorNetwork.rawValue, [])
            return
        }
        
        Alamofire.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil).responseJSON { (response:DataResponse<Any>) in
            
            switch(response.result) {
            case .success(_):
                if let data = response.result.value{
                    
                    var list = [OwnerEntidy]()
                    let json = JSON(data)

                    list.append(OwnerEntidy(rawData: json))

                    handler(statusCodes.resultOk.rawValue, list)
                }
                break
                
            case .failure(_):
                handler(statusCodes.errorServidor.rawValue, [])
                break
                
            }
            
        }
        
    }
    
    class func getPullRequests(url: String, handler: @escaping (_ statusCode: Int, _ result: [PullRequestEntidy])->Void) {
        
        guard Reachability.isConnectedToNetwork() else {
            handler(statusCodes.errorNetwork.rawValue, [])
            return
        }
        
        Alamofire.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil).responseJSON { (response:DataResponse<Any>) in
            
            switch(response.result) {
            case .success(_):
                if let data = response.result.value{
                    
                    var pulls = [PullRequestEntidy]()
                    let json = JSON(data)
                    
                    for (_,subJson) in json {
                        pulls.append(PullRequestEntidy(rawData: subJson))
                    }
                    
                    handler(statusCodes.resultOk.rawValue, pulls)
                }
                break
                
            case .failure(_):
                handler(statusCodes.errorServidor.rawValue, [])
                break
                
            }
        }
        
    }
}
