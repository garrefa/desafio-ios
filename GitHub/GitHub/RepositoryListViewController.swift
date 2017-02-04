//
//  RepositoryListViewController.swift
//  GitHub
//
//  Created by Juliana Lacerda on 03/02/17.
//  Copyright © 2017 Juliana Lacerda. All rights reserved.
//

import UIKit

class RepositoryListViewController: UIViewController {

    @IBOutlet weak var tableRepository: UITableView!
    fileprivate var modelRepository: RepositoryViewModel? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.modelRepository = RepositoryViewModel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        title = "GitHub JavaPop"
        
        self.modelRepository?.assignController(controller: self)
        self.modelRepository?.requestRepositories()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        title = ""
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension RepositoryListViewController: RepositoryProtocol {
    
    func reloadTable() {
        self.tableRepository.reloadData()
    }
}

extension RepositoryListViewController: UITableViewDelegate, UITableViewDataSource {
    
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellRepository", for: indexPath) as! RepositoryTableViewCell
        if let repository = self.modelRepository?.repositories[indexPath.row] {
            cell.setData(repository: repository)
        }
        
        return cell
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.modelRepository?.repositories.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        let currentRepository = self.modelRepository?.repositories[indexPath.row]
        
        let prController = self.storyboard?.instantiateViewController(withIdentifier: "PullRequestList") as! PullRequestListViewController
        prController.repository = currentRepository
        
        self.navigationController?.pushViewController(prController, animated: true)
        
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let lastElement = (self.modelRepository?.repositories.count)! - 1
        if indexPath.row == lastElement {
            self.modelRepository?.requestRepositories()
        }
    }

}
