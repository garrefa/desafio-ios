import Foundation
import UIKit

final class DetailViewController: UIViewController {
    
    // MARK: - Properties
    
    var viewModel: DetailViewModel! {
        didSet {
            guard isViewLoaded else { return }
            setupNavigationController()
            viewModel.tableView = detailView?.tableView
        }
    }
    
    private var detailView: TableViewView?
    
    // MARK: - Overrides
    
    override func loadView() {
        super.loadView()
        
        guard detailView == nil else { return }
        
        detailView = TableViewView()
        self.view = detailView
        detailView?.loadView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel?.tableView = detailView?.tableView
        setupNavigationController()
    }
    
    // MARK: - Private
    
    private func setupNavigationController() {
        title = viewModel.screenTitle
    }
}
