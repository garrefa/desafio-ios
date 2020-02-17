//
//  TableViewModel.swift
//  Improving
//
//  Created by Bruno Wide on 29/11/19.
//  Copyright © 2019 BWide. All rights reserved.
//

import Foundation
import UIKit

class TableViewModel<T>: NSObject, UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - Properties
    var items: [[T]] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    var tableView: TestTableView! {
        didSet {
            setup(tableView: tableView)
        }
    }
    
    typealias RowSelected = (_ index: IndexPath, _ cell: TestTableViewCell, _ item: T?) -> Void
    
    var didSelectRow: RowSelected?
    
    // MARK: - Public
    func setup(tableView: TestTableView) {
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 50
        
        registerCells()
    }
    func registerCells() {
        register(TestTableViewCell.self)
    }
    
    func configure(_ cell: TestTableViewCell, with item: T?) {
        fatalError("must override this funcion")
    }
    
    func cellIdentifier(for indexPath: IndexPath) -> String {
        fatalError("must override this method")
    }
    
    func dequeueCell(for indexPath: IndexPath) -> TestTableViewCell {
        guard let cell =
            tableView.dequeueReusableCell(withIdentifier: cellIdentifier(for: indexPath),
                                      for: indexPath) as? TestTableViewCell else {
                                    fatalError("couldn't dequeue improving cell")
        }
        
        return cell
    }
    
    // MARK: - UITableViewDataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = dequeueCell(for: indexPath)
        let item = itemForRow(at: indexPath)
        
        configure(cell, with: item)
        
        return cell
    }
    
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = dequeueCell(for: indexPath)
        
        didSelectRow?(indexPath, cell, itemForRow(at: indexPath))
    }
    
    // MARK: - Helpers
    func register(_ cell: TestTableViewCell.Type) {
        tableView.register(cell, forCellReuseIdentifier: cell.identifier)
    }
    
    func insert(elements: [T], in section: Int) {
        items.insert(elements, at: section)
        tableView.reloadSections([section], with: .automatic)
    }
    
    func itemForRow(at indexPath: IndexPath) -> T? {
        guard indexPath.section >= 0, indexPath.section < items.count else {
            print("no such section")
            return nil
        }
        guard indexPath.row >= 0, indexPath.row < items[indexPath.section].count else {
            print("no such row")
            return nil
        }
        
        return items[indexPath.section][indexPath.row]
    }
}


