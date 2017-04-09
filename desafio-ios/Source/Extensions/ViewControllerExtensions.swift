//
//  ViewControllerExtensions.swift
//  desafio-ios
//
//  Created by Cicero Camargo on 08/04/17.
//  Copyright © 2017 Stationfy. All rights reserved.
//

import UIKit

protocol AlertPresenter {
    /// Presents an alert with a given `title/message` and adds an action with title of `dismissActionTitle` which only 
    /// dismisses the alert, without executing any code.
    func presentDismissableAlert(title: String, message: String, dismissActionTitle: String)
}

extension UIViewController: AlertPresenter {
    
    func presentDismissableAlert(title: String, message: String, dismissActionTitle: String) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: dismissActionTitle, style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
}
