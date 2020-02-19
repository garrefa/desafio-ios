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
        tableView.registerNib(HeaderTableViewCell.self)
    }
    
    private func generatePullRequestTableViewCell(forTableView tableView: UITableView, at indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCellWithDefaultIdentifier(PullRequestTableViewCell.self) else {
            return UITableViewCell()
        }
        cell.setupCell(pullRequest:pullRequests[indexPath.row-1])
        return cell
    }
    
    private func generateHeaderTableViewCell(forTableView tableView: UITableView, at indexPath: IndexPath) -> UITableViewCell {
           
           guard let cell = tableView.dequeueReusableCellWithDefaultIdentifier(HeaderTableViewCell.self) else {
               return UITableViewCell()
           }
           return cell
    }
    
    
}


// MARK: Delegate TableView
extension PullRequestDataScource:UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pullRequests.count+1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
            case 0:
               return generateHeaderTableViewCell(forTableView: tableView, at: indexPath)
            default:
                return generatePullRequestTableViewCell(forTableView: tableView, at: indexPath)
        }
    }
}


extension PullRequestDataScource: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
            case 0:
                return HeaderTableViewCell.cellHeight
            default:
                return PullRequestTableViewCell.cellHeight
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let pullRequest = pullRequests[indexPath.row-1]
        if let url = pullRequest.url {
            guard let url = URL(string:url) else { return }
            UIApplication.shared.open(url)
        }
    }
}
