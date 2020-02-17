//
//  TestTableViewCell.swift
//  Improving
//
//  Created by Bruno Wide on 29/11/19.
//  Copyright © 2019 BWide. All rights reserved.
//

import Foundation
import UIKit

class TestTableViewCell: UITableViewCell, CodableView {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
        
        loadView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    class var identifier: String {
        return String(describing: self)
    }
    
    func setupViewHierarchy() {
        
    }
    
    func setupConstraints() {
        
    }
    
    func additionalSetup() {
        
    }
}
