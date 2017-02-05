//
//  Protocols.swift
//  GitHub
//
//  Created by Juliana Lacerda on 04/02/17.
//  Copyright © 2017 Juliana Lacerda. All rights reserved.
//

import Foundation
import UIKit
import PKHUD

protocol ControllersProtocol {

    func showLoading()
    func hideLoading()
    func showAlert(title: String, message: String)
}

extension ControllersProtocol where Self: UIViewController {

    func showLoading() {
        HUD.show(.progress)
    }
    
    func hideLoading() {
        HUD.flash(.success, delay: 0.2)
    }
    
    func showAlert(title: String, message: String) {
        self.hideLoading()
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
