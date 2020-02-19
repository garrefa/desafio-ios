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
    var startPage = 1
    var router = HomeRouter()
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setupNavigationBarItems()
        configTableView()
        self.getRepositories(page:startPage)
    }
    
    // MARK: Setup
    private func setup(){
        let viewController = self
        let interactor = HomeInteractor()
        let presenter = HomePresenter()
        presenter.viewController = viewController
        router.homeViewController = viewController
        interactor.presenter = presenter
        dataSource.offset = startPage
        dataSource.viewController = viewController
        viewController.interactor = interactor as RepositoryListBusinessLogic
    }
    
    private func configTableView() {
        tableView.dataSource = dataSource as UITableViewDataSource
        tableView.delegate = dataSource
        dataSource.tableView = tableView
        tableView.accessibilityLabel = "hometableView"
        dataSource.registerNibs(in: tableView)
    }
    
    func getRepositories(page:Int) {
        interactor?.fetchListRepository(page:page)
    }
    
}

extension HomeViewController:HomeOutput{
    func loadingView(isLoading:Bool) {
        dataSource.isLoading = isLoading
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
                    dataSource.repositories += repositories
            }
        }
    }
}

extension HomeViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
              super.prepare(for: segue, sender: sender)
             if segue.identifier == SegueName.goToPullRequestList.rawValue {
                 guard let destinationVC = segue.destination as? PullRequestsViewController else { return }
                 destinationVC.currentRepository = dataSource.currentRepository
                 destinationVC.title = dataSource.currentRepository?.name
             }
     }
}
