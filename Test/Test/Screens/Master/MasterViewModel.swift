import Foundation
import APIKit

final class MasterViewModel: TableViewModel<Repository> {
    
    // MARK: - Properties
    private let controller = GithubController()
    
    // MARK: - Initializer
    override init() {
        super.init()
        loadIssues()
    }
    
    // MARK: - Overrides
    override func registerCells() {
        super.registerCells()
        register(RepositoryCell.self)
    }
    
    override func cellIdentifier(for indexPath: IndexPath) -> String {
        return RepositoryCell.identifier
    }
    
    override func configure(_ cell: TestTableViewCell, with item: Repository?) {
        guard let cell = cell as? RepositoryCell else { fatalError("") }
        cell.repository = item
    }
    
    // MARK: - Private
    
    private func loadIssues() {
        controller.searchRepositories(query: "language:Java", sort: .stars, page: 1) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case let .success(response):
                guard let elements = response.items else { return }
                self.insert(elements: elements, in: 0)
            case let .failure(error):
                print(error.localizedDescription)
                break //TODO
            }
        }
    }
}
