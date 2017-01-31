//
//  PullRequestsOfARepositoryViewController.swift
//  Desafio iOS
//
//  Created by João Pedro Souza on 30/01/17.
//  Copyright © 2017 Arena. All rights reserved.
//

import UIKit
import MBProgressHUD

class PullRequestsOfARepositoryViewController: BaseViewController {

  // MARK: IBOutlets
  
  @IBOutlet weak var labelOpened: UILabel!
  @IBOutlet weak var labelClosed: UILabel!  
  @IBOutlet weak var tableView: UITableView!
  
  // MARK: Members
  
  var pullRequests = [PullRequest]()
  var repository: Repository!
  
  // MARK: Lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupTableView()
    
    if let repository = self.repository {
      self.title = repository.name
      requestPullRequests(forRepository: repository)
    }
  }
  
  // MARK: Public
  
  func countClosedAndOpenedPullRequests(pullRequests: [PullRequest]) -> [Int] {
    var openedCount = 0
    var closedCount = 0
    
    for pullRequest in pullRequests {
      if pullRequest.state == kStateOpen {
        openedCount = openedCount + 1
      } else if pullRequest.state == kStateClosed {
        closedCount = closedCount + 1
      }
    }
    
    return [openedCount ,  closedCount]
  }
  
  // MARK: Private
  
  fileprivate func clearSelectionIfExists() {
    if let indexPath = tableView.indexPathForSelectedRow {
      tableView.deselectRow(at: indexPath, animated: true)
    }
  }
  
  private func setupTableView() {
    tableView.estimatedRowHeight = 140.0
    tableView.rowHeight = UITableViewAutomaticDimension
  }
  
  private func requestPullRequests(forRepository repository: Repository) {
    MBProgressHUD.showAdded(to: self.view, animated: true)
    APIManager.shared.pullRequests(withRepository: repository) { (pullRequests, error) in
      MBProgressHUD.hide(for: self.view, animated: true)
      if let error = error {
        self.presentAlertController(withTitle: "Error", message: error.localizedDescription, options: ["OK"], selected: nil)
      } else if let pullRequests = pullRequests as? [PullRequest] {
        self.pullRequests = pullRequests
        self.tableView.reloadData()
        
        let counts = self.countClosedAndOpenedPullRequests(pullRequests: self.pullRequests)
        self.labelOpened.text = "\(counts[0])"
        self.labelClosed.text = "\(counts[1])"
      }
    }
  }

}

// MARK: - UITableViewDataSource

extension PullRequestsOfARepositoryViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return pullRequests.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.pullRequestCell, for: indexPath)
    cell!.pullRequest = pullRequests[indexPath.row]
    return cell!
  }
}

// MARK: - UITableViewDelegate

extension PullRequestsOfARepositoryViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let pullRequest = self.pullRequests[indexPath.row];
    if let url = URL(string: pullRequest.htmlURL) {
      UIApplication.shared.openURL(url)
    }
    self.clearSelectionIfExists()
    

  }
}
