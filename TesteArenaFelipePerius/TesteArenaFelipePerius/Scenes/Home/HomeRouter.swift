//
//  HomeRouter.swift
//  TesteArenaFelipePerius
//
//  Created by Felipe perius on 18/02/20.
//  Copyright © 2020 Felipe Perius. All rights reserved.
//

import UIKit

class HomeRouter: NSObject {
      weak var homeViewController: HomeViewController!
      
       func goToPullRequestList() {
            homeViewController.performSegue(withIdentifier:SegueName.goToPullRequestList.rawValue.self, sender:nil)
      }
}
