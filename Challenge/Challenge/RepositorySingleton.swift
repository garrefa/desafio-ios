//
//  RepositorySingleton.swift
//  Challenge
//
//  Created by Gustavo Henrique on 16/04/17.
//  Copyright © 2017 Gustavo Henrique. All rights reserved.
//


import UIKit

class RepositorySingleton: NSObject {

    static let sharedInstance = RepositorySingleton()
    var repositories : [Repository] = [Repository]()
    var repository : Repository
    
    private override init() {
        self.repository = Repository()
        super.init()
    }
    
    func getRepository() -> Repository {
        return self.repository
    }
    
    func setRepository(newRepository: Repository) {
        self.repository = newRepository
    }
    
    func getRepositories() -> [Repository] {
        return self.repositories
    }
    
    func addRepository(newRepository: Repository) {
        self.repositories.append(newRepository)
    }
    
    func fetchRepositories(page: Int, completionHandler completion: @escaping ()->Void) {
        
        RepositoryHandler.repositoriesFrom(page: "\(page)"){ (result: [Repository]) in
            if result.count > 0 {
                for repository in result {
                    self.repositories.append(repository)
                }
                completion()
            }
        }
    }
    
}
