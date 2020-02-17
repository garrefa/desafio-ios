import Foundation
import UIKit
import SnapKit

final class TableViewView: UIView {
    lazy var tableView: TestTableView = {
        var ans = TestTableView()
        
        return ans
    }()
}

extension TableViewView: CodableView {
    func setupViewHierarchy() {
        addSubview(tableView)
    }
    
    func setupConstraints() {
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func additionalSetup() {
        
    }
}
