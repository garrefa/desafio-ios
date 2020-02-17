//
//  HomeViewController+ExtensionNavBar.swift
//  TesteArenaFelipePerius
//
//  Created by Felipe perius on 16/02/20.
//  Copyright © 2020 Felipe Perius. All rights reserved.
//

import UIKit

extension HomeViewController {
    
    func setupNavigationBarItems() {
        setupLeftNavItem()
        setupTitle()
    }
    
    private func setupTitle() {
        self.title = "GitHub JavaPop"
    }
    
    private func setupLeftNavItem() {
        let menuButton = UIButton(type: .system)
        menuButton.setImage(#imageLiteral(resourceName: "ic_menu").withRenderingMode(.alwaysOriginal), for: .normal)
        menuButton.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: menuButton)
    }
}
