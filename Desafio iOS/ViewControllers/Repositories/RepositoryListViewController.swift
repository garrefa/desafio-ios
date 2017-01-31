//
//  RepositoryListViewController.swift
//  Desafio iOS
//
//  Created by João Pedro Souza on 30/01/17.
//  Copyright © 2017 Arena. All rights reserved.
//

import UIKit
import MBProgressHUD


class RepositoryListViewController: BaseViewController {

  // MARK: IBOutlets
  
  @IBOutlet weak var tableView: UITableView!
  
  // MARK: Members
  
  var repositoryList = RepositoryList()
  
  private var currentPage = 1
  
  // MARK: Lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    addInfinityScroll()
    
    MBProgressHUD.showAdded(to: self.view, animated: true)
    searchRepositories(withPage: currentPage) { repositories in
      MBProgressHUD.hide(for: self.view, animated: true)
      if let repositories = repositories {
        self.repositoryList = repositories
        self.tableView.reloadData()
      }
    }
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    clearSelectionIfExists()
  }
  
  // MARK: Private
  
  private func clearSelectionIfExists() {
    if let indexPath = tableView.indexPathForSelectedRow {
      tableView.deselectRow(at: indexPath, animated: true)
    }
  }

  private func addInfinityScroll() {
    let animator = DefaultInfiniteAnimator(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
    tableView.fty.infiniteScroll.add(animator: animator) { [unowned self] in
      
      self.currentPage = self.currentPage + 1
      if self.currentPage <= self.repositoryList.totalCount {
        self.searchRepositories(withPage: self.currentPage) { repositories in
          self.tableView.fty.infiniteScroll.end()
          if let repositories = repositories {
            self.repositoryList.repositories.append(contentsOf: repositories.repositories)
            self.tableView.reloadData()
          }
        }
      }
    }
  }
  
  private func searchRepositories(withPage page: Int, completion: @escaping (_ repositories: RepositoryList?) -> Void) {
    APIManager.shared.repositories(withLanguage: "Java", page: page) { (repositories, error) in
      if let error = error {
        self.presentAlertController(withTitle: "Error", message: error.localizedDescription, options: ["OK"], selected: nil)
        completion(nil)
      } else if let list = repositories as? RepositoryList  {
        completion(list)
      }
    }
  }
}

// MARK: - UITableViewDataSource

extension RepositoryListViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.repositoryList.repositories.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.repositoryCell, for: indexPath)
    cell!.repository = self.repositoryList.repositories[indexPath.row]
    return cell!
  }
}

// MARK: - UITableViewDelegate

extension RepositoryListViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let repository = self.repositoryList.repositories[indexPath.row]
    self.performSegue(withIdentifier: R.segue.repositoryListViewController.pullRequests, sender: repository)
  }
}

// MARK: - Navigation

extension RepositoryListViewController {
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == R.segue.repositoryListViewController.pullRequests.identifier {
      if let pullRequestsOfARepositoryViewController = segue.destination as? PullRequestsOfARepositoryViewController, let repository = sender as? Repository {
        pullRequestsOfARepositoryViewController.repository = repository
      }
    }
  }
}





