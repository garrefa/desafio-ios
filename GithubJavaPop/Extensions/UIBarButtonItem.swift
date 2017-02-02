
import Foundation
import UIKit

extension UIBarButtonItem {
  
  func clear() -> UIBarButtonItem {
    
    self.title = ""
    self.style = .plain
    self.target = nil
    self.action = nil
    
    return self
    
  }
  
}
