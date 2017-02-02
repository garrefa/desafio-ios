
import Foundation

class PullRequestViewModel {
  
  private var pullRequest: PullRequest
  
  var title: String {
    return self.pullRequest.title
  }
  
  var body: String {
    return self.pullRequest.body
  }
  
  var date: String {
    return self.pullRequest.date
  }
  
  var url: URL {
    return URL(string: self.pullRequest.url)!
  }
  
  var state: String {
    return self.pullRequest.state
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
  
}
