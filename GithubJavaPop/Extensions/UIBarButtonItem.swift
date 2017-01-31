
import Foundation
import UIKit

extension UIBarButtonItem {
  
  func back(action: Selector?, target: UIViewController?) -> UIBarButtonItem {
    
    self.title = NSLocalizedString("generalBackButton", comment: "")
    self.style = .plain
    self.target = target ?? nil
    self.action = action ?? nil
    
    return self
    
  }
  
}
