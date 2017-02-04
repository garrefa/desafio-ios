//
//  PullRequestListViewController.swift
//  GitHub
//
//  Created by Juliana Lacerda on 03/02/17.
//  Copyright © 2017 Juliana Lacerda. All rights reserved.
//

import UIKit
import SafariServices

class PullRequestListViewController: UIViewController {

    @IBOutlet weak var tablePullRequest: UITableView!
    
    @IBOutlet weak var countPullsOpened: UILabel!
    @IBOutlet weak var countPullsClosed: UILabel!
    
    var repository: RepositoryEntity?
    
    fileprivate var modelPullRequest: PullRequestViewModel? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.modelPullRequest = PullRequestViewModel()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        title = repository?.name
        
        self.modelPullRequest?.assignController(controller: self)
        self.modelPullRequest?.requestPullRequests(url: (repository?.pullsUrl)!)
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

extension PullRequestListViewController: PullRequestProtocol {
    
    func reloadTable() {
        self.tablePullRequest.reloadData()
        
        self.countPullsClosed.text = self.modelPullRequest?.getPullsClosed()
        self.countPullsOpened.text = self.modelPullRequest?.getPullsOpened()
    }
}

extension PullRequestListViewController: UITableViewDelegate, UITableViewDataSource {
    
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellPullRequest", for: indexPath) as! PullRequestTableViewCell
        if let pull = self.modelPullRequest?.pulls[indexPath.row] {
            cell.setData(pullRequest: pull)
        }
        
        return cell
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.modelPullRequest?.pulls.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        let currentPull = self.modelPullRequest?.pulls[indexPath.row]
        
        let prController = self.storyboard?.instantiateViewController(withIdentifier: "PullRequestDetail") as! PullRequestViewController
        prController.urlPullRequest = currentPull?.htmlUrl
        
        self.navigationController?.pushViewController(prController, animated: true)
        
    }
    
}
