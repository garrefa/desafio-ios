
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
    
    RepositoryApi.getRepositories(success: { (repositoriesViewModel) in
      self.repositoryViewModel = repositoriesViewModel.first
      print(self.repositoryViewModel.name)
      print(repositoriesViewModel.count)
    }) { (statusCode, response, error) in
      print(statusCode)
    }
    
  }
  
}
