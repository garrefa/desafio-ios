//
//  Extensions.swift
//  Challenge
//
//  Created by Gustavo Henrique on 16/04/17.
//  Copyright © 2017 Gustavo Henrique. All rights reserved.
//


import UIKit

extension UIImageView  {
    
    func roundToCircle(){
        self.layer.borderWidth = 1.0
        self.layer.cornerRadius = self.bounds.width/2
        self.layer.masksToBounds = true
    }
    
}

extension UIViewController {
    
    func setAlert(msg: String, completion: (() -> ())?) {
        
        let alertController = UIAlertController(title: "Mensagem", message: msg, preferredStyle: UIAlertControllerStyle.alert)
        
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) { (result : UIAlertAction) -> Void in
            completion?()
        }
        
        alertController.view.layer.cornerRadius = 15
        alertController.view.tintColor = UIColor.black
        alertController.view.backgroundColor = UIColor().UIColorFromRGB(rgbValue: 0x1ABC9C)
        
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    func activityView(view: UIView, overlayView: UIView, activityView: UIActivityIndicatorView) {
        
        
        overlayView.frame = view.bounds
        overlayView.center = CGPoint(x: view.bounds.width / 2.0, y:view.bounds.height / 2.0)
        overlayView.backgroundColor = UIColor.white
        overlayView.alpha = 0.8
        overlayView.clipsToBounds = true
        overlayView.layer.cornerRadius = 10
        
        activityView.frame = CGRect(origin: CGPoint(x:0, y:0), size: CGSize(width:40, height:40))
        activityView.activityIndicatorViewStyle = .gray
        activityView.center = CGPoint(x: overlayView.bounds.width / 2, y: overlayView.bounds.height / 2)
        
        overlayView.addSubview(activityView)
        view.addSubview(overlayView)
        
        activityView.startAnimating()
        
    }
    
}

extension UIColor {
    
    public convenience init?(hexString: String) {
        let r, g, b, a: CGFloat
        
        if hexString.hasPrefix("#") {
            let start = hexString.index(hexString.startIndex, offsetBy: 1)
            let hexColor = hexString.substring(from: start)
            
            if hexColor.characters.count == 8 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0
                
                if scanner.scanHexInt64(&hexNumber) {
                    r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                    g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                    b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                    a = CGFloat(hexNumber & 0x000000ff) / 255
                    
                    self.init(red: r, green: g, blue: b, alpha: a)
                    return
                }
            }
        }
        
        return nil
    }
    
    func UIColorFromRGB(rgbValue: UInt) -> UIColor {
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
}
