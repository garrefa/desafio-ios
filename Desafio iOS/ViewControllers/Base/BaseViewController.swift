//
//  BaseViewController.swift
//  Sambonde
//
//  Created by João Pedro Souza on 08/01/17.
//  Copyright © 2017 Souza. All rights reserved.
//

//
//  BaseViewController.swift
//  Desafio iOS
//
//  Created by João Pedro Souza on 30/01/17.
//  Copyright © 2017 Arena. All rights reserved.
//


import UIKit

@IBDesignable
class BaseViewController: UIViewController {
  
  // MARK: Members
  
  @IBInspectable var shouldShowNavigationBar: Bool = false
  @IBInspectable var cleanNavigationBar: Bool = false
  @IBInspectable var navigationTitleColor: UIColor? = nil
  @IBInspectable var navigationBarColor: UIColor? = nil
  @IBInspectable var backButtonImage: UIImage? = nil
  @IBInspectable var navigationBarBackgroundImage: UIImage? = nil
  @IBInspectable var shouldHideNavigationBarOnDisappear: Bool = false
  @IBInspectable var statusBarStyle: Int = 0
  @IBInspectable var navigationTitleFontSize: CGFloat = 13.0
  @IBInspectable var navigationTitleFontName: String? = nil
  
  var shouldShowBackButtonAnyWay = false
  
  // MARK: Lifecycle
  
  override func viewDidLoad() {
      super.viewDidLoad()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    configureNavigationBarVisibility()
    configureIfNavigationBarNeedsCleanBackground()
    configureNavigationBarTitleColor()
    configureNavigationBarTintColor()
    configureBackButtonImage()
    configureNavigationBarTitleFont()
    configureNavigationBarBackgroundImage()
  }

  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    
    hidesNavigationBarIfNeeded()
  }
  
  // MARK: Public
  
  override var preferredStatusBarStyle: UIStatusBarStyle {        
    if let style = UIStatusBarStyle(rawValue: statusBarStyle) {
      return style
    } else {
      return .default
    }
  }
  
  func configureNavigationBarVisibility() {
    if let navController = navigationController {
      navController.setNavigationBarHidden(!shouldShowNavigationBar, animated: true)
    }
  }
  
  func configureIfNavigationBarNeedsCleanBackground() {
    if let navController = navigationController {
      if cleanNavigationBar {
        navController.navigationBar.isTranslucent = true        
        navController.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navController.navigationBar.shadowImage = UIImage()
      } else {
        navController.navigationBar.isTranslucent = false
        navController.navigationBar.setBackgroundImage(nil, for: .default)
        navController.navigationBar.shadowImage = nil
      }
    }
  }
  
  func configureNavigationBarTitleColor() {
    if let color = navigationTitleColor, let navController = navigationController {
      if var attributes = navController.navigationBar.titleTextAttributes {
        attributes[NSForegroundColorAttributeName] = color
        navController.navigationBar.titleTextAttributes = attributes
      } else {
        navController.navigationBar.titleTextAttributes = [ NSForegroundColorAttributeName : color]
      }
    }
  }
  
  func configureNavigationBarTitleFont() {
    if let fontName = navigationTitleFontName, let navController = navigationController {
      if var attributes = navController.navigationBar.titleTextAttributes {
        if let font =  UIFont(name: fontName, size: navigationTitleFontSize) {
          attributes[NSFontAttributeName] = font
          navController.navigationBar.titleTextAttributes = attributes
        }
      } else {
        if let font =  UIFont(name: fontName, size: navigationTitleFontSize) {
          navController.navigationBar.titleTextAttributes = [ NSFontAttributeName: font]
        }
      }
    }
  }
  
  func configureNavigationBarTintColor() {
    if let color = navigationBarColor, let navController = navigationController {
      navController.navigationBar.barTintColor = color
    }
  }
  
  func configureBackButtonImage() {
    if let backImage = backButtonImage, let navController = navigationController {
      if navController.viewControllers.count > 1 || self.shouldShowBackButtonAnyWay == true {
        self.navigationItem.leftBarButtonItem = NavigationBarHelper.createBarButton(withImage: backImage, target: self, action: #selector(BaseViewController.back(sender:)))
      }
    }
  }
  
  func hidesNavigationBarIfNeeded() {
    if let navController = navigationController {
      navController.setNavigationBarHidden(shouldHideNavigationBarOnDisappear, animated: true)
    }
  }
  
  func configureNavigationBarBackgroundImage() {
    if let navigationBarBackgroundImage = self.navigationBarBackgroundImage, let navController = navigationController {
      navController.navigationBar.setBackgroundImage(navigationBarBackgroundImage, for: .default)
      navController.navigationBar.shadowImage = UIImage()
    }
  }

  // MARK: Action
  
  func back(sender: Any) {
    if let navController = navigationController {
      navController.popViewController(animated: true)
    }
  }
  
}
