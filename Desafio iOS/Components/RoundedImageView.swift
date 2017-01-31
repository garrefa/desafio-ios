//
//  RoundedImageView.swift
//  Desafio iOS
//
//  Created by João Pedro Souza on 30/01/17.
//  Copyright © 2017 Souza. All rights reserved.
//

import UIKit

@IBDesignable
class RoundedImageView: UIImageView {
  @IBInspectable var borderColor: UIColor? {
    didSet {
      layer.borderColor = borderColor?.cgColor
    }
  }
  
  @IBInspectable var borderWidth: CGFloat = 0 {
    didSet {
      layer.borderWidth = borderWidth
    }
  }
  
  @IBInspectable var cornerRadius: CGFloat = 0 {
    didSet {
      layer.cornerRadius = cornerRadius
      layer.masksToBounds = cornerRadius > 0
    }
  }
  
  override public func layoutSubviews() {
    super.layoutSubviews()
    layer.cornerRadius = 0.5 * bounds.size.width
    layer.masksToBounds = true
  }
}
