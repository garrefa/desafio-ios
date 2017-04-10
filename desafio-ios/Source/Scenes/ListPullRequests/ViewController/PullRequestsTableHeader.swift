//
//  PullRequestsTableHeader.swift
//  desafio-ios
//
//  Created by Cicero Camargo on 09/04/17.
//  Copyright © 2017 Stationfy. All rights reserved.
//

import UIKit

class PullRequestsTableHeader: UITableViewHeaderFooterView {
    
    static let estimatedHeight: CGFloat = 36
    
    var attributedText: NSAttributedString? {
        didSet {
            titleLabel.attributedText = attributedText
            activityIndicator.stopAnimating()
        }
    }
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
}
