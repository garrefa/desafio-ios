
import Foundation

extension Bundle {
  
  func getAppVersion() -> String {
    return self.object(forInfoDictionaryKey: "CFBundleShortVersionString") as! String
  }
  
}
