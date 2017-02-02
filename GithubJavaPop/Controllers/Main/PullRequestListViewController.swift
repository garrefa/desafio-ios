
import Foundation
import UIKit

class PullRequestListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
  @IBOutlet weak var tableView: UITableView!
  var repositoryName: String!
  var repositoryOwner: String!
  fileprivate var pullRequestsViewModel = [PullRequestViewModel]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.customizeInterface()
    self.configureTableView()
    self.loadPullRequests()
  }
  
  fileprivate func customizeInterface() {
    self.navigationItem.title = self.repositoryName
    self.automaticallyAdjustsScrollViewInsets = false
  }
  
  fileprivate func configureTableView() {
    
    self.tableView.rowHeight = UITableViewAutomaticDimension
    self.tableView.estimatedRowHeight = 152
    
    let nib = UINib(nibName: "PullRequestCell", bundle: Bundle.main)
    self.tableView.register(nib, forCellReuseIdentifier: "prCell")
    
  }
  
  fileprivate func loadPullRequests() {
    
    PullRequestApi.getPullRequests(owner: self.repositoryOwner, repository: self.repositoryName, success: { pullRequestsViewModel in
      self.pullRequestsViewModel = pullRequestsViewModel
      self.tableView.reloadData()
    }) { (statusCode, response, error) in
      Alert.connectionError()
      _ = self.navigationController?.popViewController(animated: true)
    }
    
  }
  
  
  // MARK: - UITableView Delegates
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.pullRequestsViewModel.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let pullRequest = self.pullRequestsViewModel[indexPath.row]
    
    let cell = tableView.dequeueReusableCell(withIdentifier: "prCell", for: indexPath) as! PullRequestCell
    cell.titleLabel.text = pullRequest.title
    cell.bodyLabel.text = pullRequest.body
    cell.ownerNameLabel.text = pullRequest.ownerNick
    cell.dateLabel.text = pullRequest.date
    cell.ownerAvatarImageView.load(url: pullRequest.ownerAvatarUrl)
    
    return cell
    
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let pullRequest = self.pullRequestsViewModel[indexPath.row]
    UIApplication.shared.openURL(pullRequest.url)
    tableView.deselectRow(at: indexPath, animated: true)
  }
  
}
