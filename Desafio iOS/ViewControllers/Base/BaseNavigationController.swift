//
//  BaseNavigationController.swift
//  Desafio iOS
//
//  Created by João Pedro Souza on 30/01/17.
//  Copyright © 2017 Arena. All rights reserved.
//


import UIKit

class BaseNavigationController: UINavigationController {

  override func viewDidLoad() {
      super.viewDidLoad()
  }
  
  override var preferredStatusBarStyle: UIStatusBarStyle {
    if let lastViewController = self.viewControllers.last {
      return lastViewController.preferredStatusBarStyle
    } else {
      return .default
    }
  }
  
  override var prefersStatusBarHidden: Bool {
    if let lastViewController = self.viewControllers.last {
      return lastViewController.prefersStatusBarHidden
    } else {
      return false
    }
  }
  
}
