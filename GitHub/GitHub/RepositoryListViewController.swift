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
    @IBOutlet weak var viewMessage: UIView!
    
    fileprivate var modelRepository: RepositoryViewModel? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.modelRepository = RepositoryViewModel()
        self.modelRepository?.assignController(controller: self)
        
        self.setupView()
        self.loadData()
        
    }
    
    func loadData() {
        self.modelRepository?.requestRepositories()
    }
    
    func setupView() {
        
        self.tableRepository.isHidden = true
        self.viewMessage.isHidden = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        title = "GitHub JavaPop"
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        title = ""
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func reloadRepositories(_ sender: Any) {
        self.modelRepository?.requestRepositories()
    }
}

extension RepositoryListViewController: RepositoryProtocol {
    
    func reloadTable() {
        self.tableRepository.reloadData()
    }
    
    func existData(result: Bool) {
        if result {
            self.tableRepository.isHidden = false
            self.viewMessage.isHidden = true
        } else {
            
            self.tableRepository.isHidden = true
            self.viewMessage.isHidden = false
        }
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
