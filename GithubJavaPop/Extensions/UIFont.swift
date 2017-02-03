
import Foundation
import UIKit

extension UIFont {
  
  // MARK: - Lato
  
  convenience init(Lato: LatoFontType, fontSize: CGFloat) {
    self.init(name: Lato.rawValue, size: fontSize)!
  }
  
  enum LatoFontType: String {
    case Regular = "Lato-Regular"
    case Light = "Lato-Light"
    case Italic = "Lato-Italic"
    case Bold = "Lato-Bold"
    case BoldItalic = "Lato-BoldItalic"
    case Black = "Lato-Black"
    case BlackItalic = "Lato-BlackItalic"
  }
  
}
