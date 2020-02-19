//
//  PullRequestsViewController.swift
//  TesteArenaFelipePerius
//
//  Created by Felipe perius on 18/02/20.
//  Copyright © 2020 Felipe Perius. All rights reserved.
//

import UIKit

protocol PullRequestOutput: class {
    func displayPullRequests(viewModel:PullRequestModel.Response)
    func loadingView(isLoading:Bool)
}
class PullRequestsViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    private let dataSource = PullRequestDataScource()
    var interactor: PullRequestListBusinessLogic?
    var currentRepository:Repository?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTableView()
        self.setup()
        self.getPullRequests()
    }
    
    private func setup() {
        let viewController = self
        let interactor = PullRequestInteractor()
        let presenter = PullRequestPresenter()
        presenter.viewController = viewController
        interactor.presenter = presenter
        viewController.interactor = interactor as PullRequestListBusinessLogic
    }
    
    
    private func setupTableView() {
         tableView.dataSource = dataSource as UITableViewDataSource
         tableView.delegate = dataSource
         dataSource.tableView = tableView
         dataSource.registerNibs(in: tableView)
    }
    
    func getPullRequests() {
        if let owner = currentRepository?.owner,let nameRepo = currentRepository?.name {
            interactor?.fetchListPullRequest(owner:owner.name ?? "", repository: nameRepo)
        }
     }
    
}

extension PullRequestsViewController:PullRequestOutput{
    func displayPullRequests(viewModel: PullRequestModel.Response) {
        if viewModel.isError {
                AlertUtils.showAlertErrorWithMessage(title:"Erro", message:viewModel.messageError ?? "erro a carregar conteúdo!", viewController:self)
        } else {
            if let pullRequests = viewModel.pullRequests {
                dataSource.pullRequests = pullRequests
            }
        }
    }
    
    func loadingView(isLoading: Bool) {
        if isLoading {
            self.view.loadAnimation()
        } else {
            self.view.unload()
        }
    }
    
    
}
