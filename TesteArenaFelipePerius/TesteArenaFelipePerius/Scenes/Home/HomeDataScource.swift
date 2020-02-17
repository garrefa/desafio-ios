//
//  HomeDataScource.swift
//  TesteArenaFelipePerius
//
//  Created by Felipe perius on 17/02/20.
//  Copyright © 2020 Felipe Perius. All rights reserved.
//

import UIKit

class HomeDataScource: NSObject {
    weak var tableView: UITableView?
    
    func registerNibs(in tableView: UITableView) {
          tableView.registerNib(RepositoryTableViewCell.self)
    }
    
    private func generateRepositoryTableViewCell(forTableView tableView: UITableView, at indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCellWithDefaultIdentifier(RepositoryTableViewCell.self) else {
            return UITableViewCell()
        }
        return cell
    }
    
}


// MARK: Cells creation
extension HomeDataScource:UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return generateRepositoryTableViewCell(forTableView: tableView, at: indexPath)
    }
}


extension HomeDataScource: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return RepositoryTableViewCell.cellHeight
    }
}

