//
//  NavigationBarHelper.swift
//  Desafio iOS
//
//  Created by João Pedro Souza on 30/01/17.
//  Copyright © 2017 Souza. All rights reserved.
//


import UIKit

class NavigationBarHelper {
  class func createBarButton(withImage image: UIImage, target: Any?, action: Selector?) -> UIBarButtonItem {
    let button = UIButton(type: .system)
    button.isUserInteractionEnabled = true
    button.setBackgroundImage(image, for: .normal)
    
    if let target = target, let action = action {
      button.addTarget(target, action: action, for: .touchUpInside)
    }
    
    button.frame = CGRect(x: 0, y: 0, width: image.size.width, height: image.size.height)
    
    return UIBarButtonItem(customView: button)
  }
  
  class func createRoundedBarButton(withImage image: UIImage, target: Any?, action: Selector?) -> UIBarButtonItem {
    let button = UIButton(type: .system)
    button.isUserInteractionEnabled = true
    button.setBackgroundImage(image, for: .normal)
    
    if let target = target, let action = action {
      button.addTarget(target, action: action, for: .touchUpInside)
    }
    
    button.frame = CGRect(x: 0, y: 0, width: 32, height: 32)
    button.layer.cornerRadius = 16
    button.layer.masksToBounds = true
    
    return UIBarButtonItem(customView: button)
  }
}
