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
    
    enum api_urls: String {
        case urlBase = "https://api.github.com"
        case urlSearchRepositories = "https://api.github.com/search/repositories"
    }
    
    class func getRepositories(page: Int, language: String, sort: String, handler: @escaping (_ statusCode: Bool, _ result:[RepositoryEntity])->Void) {
        
        guard Reachability.isConnectedToNetwork() else {
            handler(false, [])
            return
        }
        
        let url = api_urls.urlSearchRepositories.rawValue + "?q=language:\(language)&sort=\(sort)&page=\(page)"
        
        Alamofire.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil).responseJSON { (response:DataResponse<Any>) in
            
            switch(response.result) {
            case .success(_):
                if let data = response.result.value{
                    
                    var repositories = [RepositoryEntity]()
                    let json = JSON(data)
                    //print(json)

                    for (_,subJson) in json["items"] {
                        repositories.append(RepositoryEntity(rawData: subJson))
                    }
                    
                    handler(true, repositories)
                }
                break
                
            case .failure(_):
                handler(false, [])
                break
                
            }
            
        }
    }
    
    class func getFullNameOwner(url: String, handler: @escaping (_ statusCode: Bool, _ result: OwnerEntidy)->Void) {
        
        guard Reachability.isConnectedToNetwork() else {
            handler(false, OwnerEntidy(rawData: JSON.null))
            return
        }
        
        Alamofire.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil).responseJSON { (response:DataResponse<Any>) in
            
            switch(response.result) {
            case .success(_):
                if let data = response.result.value{
                    
                    let json = JSON(data)

                    let owner = OwnerEntidy(rawData: json)
                    handler(true, owner)
                }
                break
                
            case .failure(_):
                handler(false, OwnerEntidy(rawData: JSON.null))
                break
                
            }
            
        }
        
    }
    
    class func getPullRequests(url: String, handler: @escaping (_ statusCode: Bool, _ result: [PullRequestEntidy])->Void) {
        
        guard Reachability.isConnectedToNetwork() else {
            handler(false, [])
            return
        }
        
        Alamofire.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil).responseJSON { (response:DataResponse<Any>) in
            
            switch(response.result) {
            case .success(_):
                if let data = response.result.value{
                    
                    var pulls = [PullRequestEntidy]()
                    let json = JSON(data)
                    //print(json)
                    
                    for (_,subJson) in json {
                        pulls.append(PullRequestEntidy(rawData: subJson))
                    }
                    
                    handler(true, pulls)
                }
                break
                
            case .failure(_):
                handler(false, [])
                break
                
            }
        }

        
    }
}
