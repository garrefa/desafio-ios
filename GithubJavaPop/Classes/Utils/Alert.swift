
import Foundation
import UIKit
import Whisper

class Alert {
  
  class func connectionError() {
    let murmur = Murmur(title: NSLocalizedString("generalErrorMessageDefault", comment: ""))
    show(whistle: murmur, action: .show(0.5))
  }
  
}
