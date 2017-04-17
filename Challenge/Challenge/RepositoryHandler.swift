//
//  RepositoryHandler.swift
//  Challenge
//
//  Created by Gustavo Henrique on 15/04/17.
//  Copyright © 2017 Gustavo Henrique. All rights reserved.
//


import UIKit
import Alamofire
import ObjectMapper

class RepositoryHandler: NSObject {
    
    static func repositoriesFrom(page: String, completionHandler completion :@escaping (_ groups : [Repository]) -> Void){
        
        let url = URLAddress.urlWithEndPoint(Endpoint.repository)+"?q=language:Java&sort=stars&page="+page
        var repositoryArray = [Repository]()
        
        Alamofire.request(url, method: .get, parameters: nil, encoding: JSONEncoding(), headers: nil).responseJSON { (data) in
            
            if data.result.isFailure {
                completion(repositoryArray)
            }else{
                
                if data.response?.statusCode == 200 {
                    if let jsonResult = data.result.value as? [String: Any] {
                        if let items = jsonResult["items"] as? [[String: Any]] {
                            if let response = Mapper<Repository>().mapArray(JSONObject: items){
                                repositoryArray = response
                                completion(repositoryArray)
                            }
                        }
                    }else{
                        completion(repositoryArray)
                    }
                }
            }
        }
    }
}
