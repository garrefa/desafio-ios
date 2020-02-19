//
//  HeaderTableViewCell.swift
//  TesteArenaFelipePerius
//
//  Created by Felipe perius on 18/02/20.
//  Copyright © 2020 Felipe Perius. All rights reserved.
//

import UIKit

class HeaderTableViewCell: UITableViewCell {
    static let identifier: String = "HeaderTableViewCell"
       
    static var cellHeight: CGFloat {
           return 60
    }
    
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func setupCell(repository:Repository?,totalCounts:Int) {
        if let number = repository?.issuesCount {
             titleLabel.text = "\(totalCounts) opened / \(number) closed"
        }
       
    }
}
