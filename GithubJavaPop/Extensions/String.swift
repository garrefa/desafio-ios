
import Foundation

extension String {
  
  func attributedWithRange(_ array: [[String : Any]]) -> NSAttributedString {
    
    let attrStr = NSMutableAttributedString(string: self, attributes: nil)
    
    for item in array {
      let attributes = item["attributes"] as! [String: Any]
      let location = item["location"] as! Int
      let length = item["length"] as! Int
      let finalLength = (length == 0) ? self.characters.count - location : length
      let range = NSMakeRange(location, finalLength)
      attrStr.addAttributes(attributes, range: range)
    }
    
    return attrStr
    
  }
  
}
