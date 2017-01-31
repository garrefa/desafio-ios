//
//  UIViewControllerExtension.swift
//  Desafio iOS
//
//  Created by João Pedro Souza on 30/01/17.
//  Copyright © 2017 Arena. All rights reserved.
//

import UIKit

typealias SelectedBlock = (Int) -> Void

extension UIViewController {
  func presentAlertController(withTitle title:String, message: String, options: [String], selected: SelectedBlock? ) {
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    
    for index in 0...options.count - 1 {
      let action = UIAlertAction(title: options[index], style: .default, handler: { (action) in
        if let block = selected {
          block(index)
        }
      })
      
      alert.addAction(action)
    }
    
    present(alert, animated: true, completion: nil)
    
  }
  
  func presentActionSheet(withTitle title:String, message: String, options: [String], selected: SelectedBlock? ) {
    let alert = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
    
    let cancelAction = UIAlertAction(title: NSLocalizedString("Cancelar",comment: ""), style: .cancel, handler: nil)
    alert.addAction(cancelAction)
    
    for index in 0...options.count - 1 {
      let action = UIAlertAction(title: options[index], style: .default, handler: { (action) in
        if let block = selected {
          block(index)
        }
      })
      
      alert.addAction(action)
    }
    
    present(alert, animated: true, completion: nil)
    
  }

}
