//
//  PullRequestWorker.swift
//  TesteArenaFelipePerius
//
//  Created by Felipe perius on 18/02/20.
//  Copyright © 2020 Felipe Perius. All rights reserved.
//

import UIKit

class PullRequestWorker: NSObject {
    
   class func getPullrequests(owner:String, repository: String, completion: @escaping (_ repositoryList:[PullRequest]?, _ error: String?) -> Void) {
    _ = PullRequestService.getPullrequests(owner: owner, repository: repository).subscribe(onNext: { (pullRequests) in
            completion(pullRequests, nil)
        }, onError: { (error) in
            completion(nil, error.message())
        }, onCompleted: nil, onDisposed: nil)
    }
}
