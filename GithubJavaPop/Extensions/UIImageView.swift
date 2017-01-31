
import UIKit
import AlamofireImage

extension UIImageView {
  
  func load(url: URL) {
    self.af_setImage(withURL: url)
  }
  
}
