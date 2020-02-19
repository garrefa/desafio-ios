//
//  PullRequestDataScource.swift
//  TesteArenaFelipePerius
//
//  Created by Felipe perius on 18/02/20.
//  Copyright © 2020 Felipe Perius. All rights reserved.
//

import UIKit

class PullRequestDataScource: NSObject {
    weak var tableView: UITableView?
    var pullRequests: [PullRequest] = [] {
           didSet {
               tableView?.reloadData()
           }
    }
    
    func registerNibs(in tableView: UITableView) {
        tableView.registerNib(PullRequestTableViewCell.self)
    }
    
    private func generatePullRequestTableViewCell(forTableView tableView: UITableView, at indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCellWithDefaultIdentifier(PullRequestTableViewCell.self) else {
            return UITableViewCell()
        }
        cell.setupCell(pullRequest:pullRequests[indexPath.row])
        return cell
    }
    
}


// MARK: Delegate TableView
extension PullRequestDataScource:UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pullRequests.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return generatePullRequestTableViewCell(forTableView: tableView, at: indexPath)
    }
}


extension PullRequestDataScource: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return PullRequestTableViewCell.cellHeight
    }
}
