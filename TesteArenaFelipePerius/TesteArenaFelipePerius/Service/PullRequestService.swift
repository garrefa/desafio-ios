//
//  PullRequestService.swift
//  TesteArenaFelipePerius
//
//  Created by Felipe perius on 18/02/20.
//  Copyright © 2020 Felipe Perius. All rights reserved.
//

import UIKit
import RxSwift
import Alamofire
import ObjectMapper

class PullRequestService: NSObject {
    class func getPullrequests(owner:String, repository: String) ->  RxSwift.Observable<[PullRequest]> {
          
          return RxSwift.Observable<[PullRequest]>.create({ (observer) -> Disposable in
          let url = Routes.getPullRequests(owner:owner, repository: repository)
              ServiceManager.defaultClient.request(url,method: .get,
                                                   parameters:nil,
                                                   encoding:JSONEncoding(),
                                                   headers:nil)
                  .validate(statusCode: 200...399)
                  .responseJSON(completionHandler: { (response) in
                      if let dic = response.value as? [[String: Any]] {
                            let pullRequests = dic.compactMap {
                                return Mapper<PullRequest>().map(JSON: $0)
                            }
                            observer.onNext(pullRequests)
                            observer.onCompleted()
                          } else {
                              observer.onError(NSError(domain: "br.com.testeiOS", code:403, userInfo: ["message": "Erro de parse"]))
                                       observer.onCompleted()
                          }
                             return observer.onCompleted()
                          })
                      
                      return Disposables.create()
          })
      }
}
