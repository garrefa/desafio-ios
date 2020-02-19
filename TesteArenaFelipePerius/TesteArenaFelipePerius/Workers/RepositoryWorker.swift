//
//  RepositoryWorker.swift
//  TesteArenaFelipePerius
//
//  Created by Felipe perius on 17/02/20.
//  Copyright © 2020 Felipe Perius. All rights reserved.
//

import UIKit

class RepositoryWorker: NSObject {
    //MARK: Get Repositories
    class func getRepositories(page:Int, completion: @escaping (_ repositoryList:RepositoryList?, _ error: String?) -> Void) {
          _ = RepositoryService.getRepositories(page:page).subscribe(onNext: { (repositories) in
              completion(repositories, nil)
          }, onError: { (error) in
              completion(nil, error.message())
          }, onCompleted: nil, onDisposed: nil)
    }
}
