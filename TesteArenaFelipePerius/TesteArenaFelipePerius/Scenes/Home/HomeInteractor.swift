//
//  HomeInteractor.swift
//  TesteArenaFelipePerius
//
//  Created by Felipe perius on 17/02/20.
//  Copyright © 2020 Felipe Perius. All rights reserved.
//

import UIKit

protocol RepositoryListBusinessLogic {
    func fetchListRepository(page:Int)
}

class HomeInteractor: RepositoryListBusinessLogic {
    var presenter: RepositoryListPresentationLogic?
    
    func fetchListRepository(page:Int) {
        self.presenter?.loadingView(isLoading:true)
        RepositoryWorker.getRepositories(page: page) { (repository, msgError) in
            self.presenter?.loadingView(isLoading:false)
            if let messsage = msgError {
                let response = HomeModel.Response.init(repositoryList:nil, isError:true, messageError: messsage)
                self.presenter?.presentRepositories(response:response)
            } else {
                let response = HomeModel.Response.init(repositoryList:repository, isError:false, messageError:nil)
                self.presenter?.presentRepositories(response:response)
            }
        }
     }
}
