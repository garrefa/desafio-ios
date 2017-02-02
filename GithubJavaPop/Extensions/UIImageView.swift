
import UIKit
import AlamofireImage

extension UIImageView {
  
  func load(url: URL) {
    self.af_setImage(withURL: url, placeholderImage: UIImage(named: "avatarPlaceholder"), filter: nil, progress: nil, progressQueue: DispatchQueue.main, imageTransition: .crossDissolve(0.2), runImageTransitionIfCached: false, completion: nil)
  }
  
}
