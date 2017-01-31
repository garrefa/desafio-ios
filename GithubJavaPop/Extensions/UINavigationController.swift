
import Foundation
import UIKit

extension UINavigationController {
  
  open override func awakeFromNib() {
    self.navigationBar.barTintColor = StyleGuide.Color.Black.value
    self.navigationBar.tintColor = StyleGuide.Color.White.value
    let font = StyleGuide.Font.Title.value
    self.navigationBar.titleTextAttributes = [NSFontAttributeName: font, NSForegroundColorAttributeName: StyleGuide.Color.White.value]
  }
  
}
