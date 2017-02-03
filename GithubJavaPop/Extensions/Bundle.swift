
import Foundation

extension Bundle {
  
  var apiEntrypoint: String {
    return self.object(forInfoDictionaryKey: "ApiEntrypoint") as! String
  }
  
}
