
import Foundation
import UIKit

class RepositoryListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
  @IBOutlet weak var tableView: UITableView!
  fileprivate var repositoriesViewModel = [RepositoryViewModel]()
  fileprivate var currentPage = 0
  fileprivate var isLoading = true
  fileprivate var isConnectionErrorShowed = false
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.customizeInterface()
    self.configureTableView()
    self.loadRepositories()
  }
  
  fileprivate func customizeInterface() {
    self.navigationItem.title = NSLocalizedString("repositoryNavTitle", comment: "")
    self.automaticallyAdjustsScrollViewInsets = false
  }
  
  fileprivate func configureTableView() {
    
    self.tableView.rowHeight = UITableViewAutomaticDimension
    self.tableView.estimatedRowHeight = 120
    
    let nib = UINib(nibName: "RepositoryCell", bundle: Bundle.main)
    self.tableView.register(nib, forCellReuseIdentifier: "repoCell")
    
  }
  
  fileprivate func loadRepositories() {
    
    self.isLoading = true
    
    RepositoryApi.getRepositories(page: self.currentPage + 1, success: { repositoriesViewModel in
      
      guard repositoriesViewModel.count > 0 else {
        self.isLoading = false
        self.isConnectionErrorShowed = false
        return
      }
      
      self.repositoriesViewModel += repositoriesViewModel
      self.tableView.reloadData()
      self.currentPage += 1
      self.isLoading = false
      self.isConnectionErrorShowed = false
      
    }) { (statusCode, response, error) in
      
      if statusCode == Api.statusCodes.disconnected.rawValue && !self.isConnectionErrorShowed {
        Alert.connectionError()
        self.isConnectionErrorShowed = true
      }
      
      self.isLoading = false
      
    }
    
  }
  
  
  // MARK: - UITableView Delegates
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.repositoriesViewModel.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let repository = self.repositoriesViewModel[indexPath.row]
    
    let cell = tableView.dequeueReusableCell(withIdentifier: "repoCell", for: indexPath) as! RepositoryCell
    cell.nameLabel.text = repository.name
    cell.descriptionLabel.text = repository.description
    cell.forksLabel.text = repository.forks
    cell.favoritesLabel.text = repository.favorites
    cell.ownerNameLabel.text = repository.ownerNick
    cell.ownerAvatarImageView.load(url: repository.ownerAvatarUrl)
    
    return cell
    
  }
  
  func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
    
    if indexPath.row >= (self.repositoriesViewModel.count - 10) && !isLoading {
      self.loadRepositories()
    }
    
  }
  
}
