//
//  HomeViewController.swift
//  TesteArenaFelipePerius
//
//  Created by Felipe perius on 16/02/20.
//  Copyright © 2020 Felipe Perius. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    private let dataSource = HomeDataScource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBarItems()
        configTableView()
    }
    
    private func configTableView() {
        tableView.dataSource = dataSource as? UITableViewDataSource
        tableView.delegate = dataSource
        dataSource.tableView = tableView
        dataSource.registerNibs(in: tableView)
    }
    
}
