
import Foundation
import UIKit
import SwiftyDrop

class Alert {
  
  class func connectionError() {
    Drop.down(NSLocalizedString("generalErrorMessageDefault", comment: ""), state: .error, duration: 3.0, action: nil)
  }
  
}
