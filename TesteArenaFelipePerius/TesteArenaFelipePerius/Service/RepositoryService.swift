//
//  RepositoryService.swift
//  TesteArenaFelipePerius
//
//  Created by Felipe perius on 17/02/20.
//  Copyright © 2020 Felipe Perius. All rights reserved.
//

import UIKit
import RxSwift
import Alamofire
import ObjectMapper

class RepositoryService: NSObject {
    class func getRepositories(page:Int) ->  RxSwift.Observable<RepositoryList> {
        
        return RxSwift.Observable<RepositoryList>.create({ (observer) -> Disposable in
            
            guard let url = Routes.getRepositories(page:page) else {
                observer.onError(NSError(domain: "br.testeIOS",code: 20,userInfo: ["message": "Erro URL!"]))
                return Disposables.create()
            }
            
            ServiceManager.defaultClient.request(url,method: .get,
                                                 parameters:nil,
                                                 encoding:JSONEncoding(),
                                                 headers:nil)
                .validate(statusCode: 200...399)
                .responseJSON(completionHandler: { (response) in
                       if let dic = response.value as? [String: Any] {
                            if let respositoryList = Mapper<RepositoryList>().map(JSON: dic) {
                                observer.onNext(respositoryList)
                            } else {
                                observer.onError(NSError(domain: "br.com.testeiOS", code:500, userInfo: ["message": "Erro a carregar informações"]))
                            }
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
