
import Foundation
import UIKit

class StyleGuide {
  
  
  // MARK: - Color
  
  enum Color {
    
    case White
    case Black
    case Red
    case Transparent
    
    var value: UIColor {
      switch self {
        case .White:
          return UIColor(r: 255, g: 255, b: 255, a: 1)
        case .Black:
          return UIColor(r: 0, g: 0, b: 0, a: 1)
        case .Red:
          return UIColor(r: 227, g: 117, b: 126, a: 1)
        case .Transparent:
          return UIColor.clear
      }
    }
    
  }
  
  
  // MARK: - Font
  
  enum Font {
    
    case Title
    
    var value: UIFont {
      switch self {
        case .Title:
          return UIFont(Lato: .Regular, fontSize: 20)
      }
    }
    
  }
  
}
