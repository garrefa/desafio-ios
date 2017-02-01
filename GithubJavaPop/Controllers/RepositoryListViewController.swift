
import Foundation
import UIKit

class RepositoryListViewController: UIViewController {
  
  @IBOutlet weak var tableView: UITableView!
  private var repositoryViewModel: RepositoryViewModel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.loadRepositories()
  }
  
  private func loadRepositories() {
    RepositoryApi.getRepositories(success: { (repositoryViewModel) in
      self.repositoryViewModel = repositoryViewModel
      print(self.repositoryViewModel.name)
    }) { (statusCode, response, error) in
      print(statusCode)
    }
  }
  
}
