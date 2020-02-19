//
//  PullRequest+ExtensionNavBar.swift
//  TesteArenaFelipePerius
//
//  Created by Felipe perius on 19/02/20.
//  Copyright © 2020 Felipe Perius. All rights reserved.
//

import UIKit

extension PullRequestsViewController {
     func setupNavigationBarItems() {
          setupLeftNavItem()
     }
     private func setupLeftNavItem() {
            let backImage = UIImage(named: "back_button")
            self.navigationController?.navigationBar.backIndicatorImage = backImage
            self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = backImage
            self.navigationController?.navigationBar.topItem?.title = ""
            self.navigationController?.navigationBar.backItem?.title = nil
     }

}
