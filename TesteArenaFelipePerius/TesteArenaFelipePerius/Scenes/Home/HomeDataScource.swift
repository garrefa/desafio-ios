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
    var viewController:HomeViewController?
    var offset:Int = 0
    var maximumPage:Int = 32
    var isLoading = false
    var currentRepository:Repository?
    
    var repositories: [Repository] = [] {
           didSet {
               tableView?.reloadData()
           }
    }
    
    func registerNibs(in tableView: UITableView) {
          tableView.registerNib(RepositoryTableViewCell.self)
    }
    
    private func generateRepositoryTableViewCell(forTableView tableView: UITableView, at indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCellWithDefaultIdentifier(RepositoryTableViewCell.self) else {
            return UITableViewCell()
        }
        cell.setupCell(respository:repositories[indexPath.row])
        return cell
    }
    
}


// MARK: Delegate TableView
extension HomeDataScource:UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repositories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return generateRepositoryTableViewCell(forTableView: tableView, at: indexPath)
    }
}


extension HomeDataScource: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return RepositoryTableViewCell.cellHeight
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.currentRepository = repositories[indexPath.row]
        self.viewController?.router.goToPullRequestList()
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let currentOffset = scrollView.contentOffset.y
        let maximumOffset = scrollView.contentSize.height - scrollView.frame.size.height
        
        if (maximumOffset - currentOffset) <= 40 && isLoading == false && offset <= maximumPage {
            offset = offset+1
            isLoading = true
            viewController?.getRepositories(page:offset)
        }
    }
}

