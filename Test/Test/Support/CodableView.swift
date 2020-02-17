//
//  CodableView.swift
//  Check
//
//  Created by Bruno Wide on 18/12/18.
//  Copyright © 2018 BrunoWide. All rights reserved.
//

import Foundation
import UIKit

protocol CodableView: UIView {
    func setupViewHierarchy()
    func setupConstraints()
    func additionalSetup()
    func loadView()
}

extension CodableView {
    
    func loadView() {
        setupViewHierarchy()
        setupConstraints()
        additionalSetup()
        
        for view in subviews {
            guard let codableView = view as? CodableView else { continue }
            codableView.loadView()
        }
    }
}
