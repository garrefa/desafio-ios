//
//  RepositoryViewModel.swift
//  GitHub
//
//  Created by Juliana Lacerda on 04/02/17.
//  Copyright © 2017 Juliana Lacerda. All rights reserved.
//

import Foundation

protocol RepositoryProtocol: class, ControllersProtocol {
    func reloadTable()
}

class RepositoryViewModel {
    
    weak var controller: RepositoryProtocol?
    
    func assignController(controller: RepositoryProtocol) {
        self.controller = controller
    }
    
    var currentPage: Int = 0
    var repositories = [RepositoryEntity]()
    
    private var isRequestingRepositories: Bool = false
    
    internal func requestRepositories() {
        
        if self.isRequestingRepositories == false {
            self.currentPage += 1
            
            self.controller?.showLoading()
            GitHubAPI.getRepositories(page: currentPage, language: "Java", sort: "stars", handler: { (statusCode, result) in
                
                self.isRequestingRepositories = false
                
                if statusCode {
                    self.repositories.append(contentsOf: result)
                    self.controller?.hideLoading()
                    self.controller?.reloadTable()
                    
                } else {
                    self.controller?.showAlert(message: "Error! Try again.")
                }
                
            })
        }
        
    }
    
}
