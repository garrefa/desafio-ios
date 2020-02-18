//
//  HomeViewController.swift
//  TesteArenaFelipePerius
//
//  Created by Felipe perius on 16/02/20.
//  Copyright © 2020 Felipe Perius. All rights reserved.
//

import UIKit
protocol HomeOutput: class {
    func displayRepositories(viewModel:HomeModel.Response)
    func loadingView(isLoading:Bool)
}

class HomeViewController: UIViewController {
    // MARK: IBOutlet
    @IBOutlet weak var tableView: UITableView!
    private let dataSource = HomeDataScource()
    var interactor: RepositoryListBusinessLogic?
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setupNavigationBarItems()
        configTableView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.getRepositories()
    }
    
    // MARK: Setup
    private func setup(){
        let viewController = self
        let interactor = HomeInteractor()
        let presenter = HomePresenter()
        presenter.viewController = viewController
        interactor.presenter = presenter
        viewController.interactor = interactor as RepositoryListBusinessLogic
    }
    
    private func configTableView() {
        tableView.dataSource = dataSource as UITableViewDataSource
        tableView.delegate = dataSource
        dataSource.tableView = tableView
        dataSource.registerNibs(in: tableView)
    }
    
    func getRepositories() {
        interactor?.fetchListRepository(page:1)
    }

}

extension HomeViewController:HomeOutput{
    func loadingView(isLoading:Bool) {
        if isLoading {
            self.view.loadAnimation()
        } else {
            self.view.unload()
        }
    }
    
    func displayRepositories(viewModel:HomeModel.Response) {
        if viewModel.isError {
            AlertUtils.showAlertErrorWithMessage(title:"Erro", message:viewModel.messageError ?? "erro a carregar repositorios!", viewController:self)
        } else {
            if let repositories = viewModel.repositoryList?.repositoryList {
                    dataSource.repositories = repositories
            }
        }
    }
}
