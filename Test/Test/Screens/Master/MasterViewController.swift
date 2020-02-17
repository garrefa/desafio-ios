import UIKit
import APIKit

class MasterViewController: UIViewController {
    
    // MARK: - Actions
    typealias ItemSelected = (_ item: Repository) -> Void
    var didSelectItem: ItemSelected?
    
    // MARK: - Properties
    var viewModel: MasterViewModel! {
        didSet {
            viewModel.didSelectRow = { [weak self] _, _, repo in
                guard let repo = repo else { return }
                self?.didSelectItem?(repo)
            }
        }
    }
    
    private var masterView: TableViewView!
    
    // MARK: - Overrides
    
    override func loadView() {
        super.loadView()
        
        masterView = TableViewView()
        self.view = masterView
        
        masterView.loadView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationController()
        
        viewModel?.tableView = masterView.tableView
    }
    
    // MARK: - Private
    
    private func setupNavigationController() {
        title = Text.masterViewTitle
    }
}
