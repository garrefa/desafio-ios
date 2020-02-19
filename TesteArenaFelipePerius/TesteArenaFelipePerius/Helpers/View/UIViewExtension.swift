//
//  UIViewExtension.swift
//  TesteiOSv2
//
//  Created by Felipe perius on 18/11/2018.
//  Copyright © 2018 Felipe Perius. All rights reserved.
//

import UIKit

extension UIView {
   
    
    func constraintEdgesToSuperview() {
        
        guard let superview = self.superview else { return }
        
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([leadingAnchor.constraint(equalTo: superview.leadingAnchor),
                                     trailingAnchor.constraint(equalTo: superview.trailingAnchor),
                                     topAnchor.constraint(equalTo: superview.topAnchor),
                                     bottomAnchor.constraint(equalTo: superview.bottomAnchor)])
    }

    func loadAnimation(_ duration: TimeInterval = 0.2) {
        
        if let _ = viewWithTag(10) {
            //View is already locked
        }
        else {
            let loadingView: UIView = UIView()
            if #available(iOS 13.0, *) {
                let activityIndicator = UIActivityIndicatorView(style: .large)
                loadingView.frame = CGRect(x: 0, y: 0, width: 80, height: 80)
                loadingView.center = CGPoint(x: self.frame.width / 2, y: self.frame.size.height / 2)
                loadingView.backgroundColor = UIColor.black.withAlphaComponent(0.6)
                loadingView.clipsToBounds = true
                loadingView.layer.cornerRadius = 10
                loadingView.tag = 10

                activityIndicator.frame = CGRect(x: 0, y: 0, width: 40.0, height: 40.0)
                activityIndicator.style = .large
                activityIndicator.color = .white
                activityIndicator.center = CGPoint(x: loadingView.frame.width / 2, y: loadingView.frame.size.height / 2)

                loadingView.addSubview(activityIndicator)
                self.addSubview(loadingView)
                activityIndicator.startAnimating()
            } else {
                
            }
          
        
        }
    }
    
    func unload(_ duration: TimeInterval = 0.2) {
        if let lockView = self.viewWithTag(10) {
            
            UIView.animate(withDuration: duration, animations: {
                lockView.alpha = 0.0
                }, completion: { finished in
                    lockView.removeFromSuperview()
            })
        }
    }
}
