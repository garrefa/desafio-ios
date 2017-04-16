//
//  PullRequestHandler.swift
//  Challenge
//
//  Created by Gustavo Henrique on 15/04/17.
//  Copyright © 2017 Gustavo Henrique. All rights reserved.
//


import UIKit
import Alamofire
import ObjectMapper

class PullRequestHandler: NSObject {

    static func requestsFrom(login: String,name: String, completion: @escaping (_ pullRequests : [PullRequest]) -> Void ) {
        
       let url = URLAddress.urlWithEndPoint(Endpoint.pullRequest)+"/\(login)/\(name)/pulls"
       var pullRequestArray : [PullRequest] = [PullRequest]()
        
       Alamofire.request(url, method: .get, parameters: nil, encoding: JSONEncoding(), headers: nil).responseJSON { (data) in
        
            if data.result.isFailure {
                completion(pullRequestArray) // Bad StatusCode
            } else {
                
                if data.response?.statusCode == 200 { // Sucesso
                    
                    if let response = Mapper<PullRequest>().mapArray(JSONObject: data.result.value){
                        pullRequestArray = response
                        completion(pullRequestArray)
                    }else{
                        completion(pullRequestArray)
                    }
                }else{
                    completion(pullRequestArray) // Bad StatusCode
                }
            }
        }
    }
}
