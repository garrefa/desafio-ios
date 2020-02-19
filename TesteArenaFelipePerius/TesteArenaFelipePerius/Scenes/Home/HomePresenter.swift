//
//  HomePresenter.swift
//  TesteArenaFelipePerius
//
//  Created by Felipe perius on 17/02/20.
//  Copyright © 2020 Felipe Perius. All rights reserved.
//

import UIKit


protocol RepositoryListPresentationLogic {
    func presentRepositories(response:HomeModel.Response)
    func loadingView(isLoading:Bool)
}

class HomePresenter: RepositoryListPresentationLogic {
    weak var viewController: HomeOutput?
    
    func loadingView(isLoading:Bool) {
        viewController?.loadingView(isLoading:isLoading)
    }
    
    func presentRepositories(response: HomeModel.Response) {
        viewController?.displayRepositories(viewModel:response)
    }
    
}
