
import Foundation
import UIKit

class PullRequestViewModel {
  
  enum prState: String {
    case open = "open"
    case closed = "closed"
  }
  
  private var pullRequest: PullRequest
  
  var title: String {
    return self.pullRequest.title
  }
  
  var body: String {
    return self.pullRequest.body
  }
  
  var date: String {
    let date = Date().dateFromString(self.pullRequest.date)
    return date.convertToLongString()
  }
  
  var url: URL {
    return URL(string: self.pullRequest.url)!
  }
  
  var state: prState {
    return prState(rawValue: self.pullRequest.state)!
  }
  
  var ownerNick: String {
    return self.pullRequest.ownerNick
  }
  
  var ownerAvatarUrl: URL {
    return URL(string: self.pullRequest.ownerAvatarUrl)!
  }
  
  init(pullRequest: PullRequest) {
    self.pullRequest = pullRequest
  }
  
  class func totalStates(_ pulls: [PullRequestViewModel]) -> NSAttributedString {
    
    var totalOpen = 0
    var totalClosed = 0
    
    for pull in pulls {
      switch pull.state {
        case .open:
          totalOpen += 1
        case .closed:
          totalClosed += 1
      }
    }
    
    let totalOpenCharacters = String(describing: totalOpen).characters.count + 8
    
    let attributes = [[
      "attributes": [
        NSFontAttributeName: StyleGuide.Font.Number.value,
        NSForegroundColorAttributeName: StyleGuide.Color.Orange.value
      ],
      "location": 0,
      "length": totalOpenCharacters
    ],[
      "attributes": [
        NSFontAttributeName: StyleGuide.Font.Number.value,
        NSForegroundColorAttributeName: StyleGuide.Color.Black.value
      ],
      "location": totalOpenCharacters,
      "length": 0
    ]]
    
    return "\(totalOpen) opened / \(totalClosed) closed".attributedWithRange(attributes)
    
  }
  
}
