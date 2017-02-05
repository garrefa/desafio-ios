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
    func existData(result:Bool)
}

class RepositoryViewModel {
    
    weak var controller: RepositoryProtocol?
    
    func assignController(controller: RepositoryProtocol) {
        self.controller = controller
    }
    
    var currentPage: Int = 1
    var repositories = [RepositoryEntity]()
    
    private var isRequestingRepositories: Bool = false
    
    internal func requestRepositories() {
        
        if self.isRequestingRepositories == false {
            
            self.controller?.showLoading()
            GitHubAPI.getRepositories(page: currentPage, language: "Java", sort: "stars", handler: { (statusCode, result) in
                
                self.isRequestingRepositories = false
                
                switch statusCode {
                    
                    case GitHubAPI.statusCodes.resultOk.rawValue:
                        
                        self.currentPage += 1
                        
                        self.repositories.append(contentsOf: result)
                        self.controller?.hideLoading()
                        self.controller?.reloadTable()
                        self.controller?.existData(result: true)
                        break
                    
                    case GitHubAPI.statusCodes.errorNetwork.rawValue:
                        
                        self.controller?.existData(result: false)
                        self.controller?.hideLoading()
                        self.controller?.showAlert(title: "No Internet Connection", message: "Make sure your device is connected to the internet.")
                        break
                    
                    case GitHubAPI.statusCodes.errorServidor.rawValue:
                        
                        self.controller?.existData(result: false)
                        self.controller?.showAlert(title: "Attention", message: "Communication error with the server. Try again.")
                        break
                    
                    default: break
                }

            })
        }
        
    }
    
}
