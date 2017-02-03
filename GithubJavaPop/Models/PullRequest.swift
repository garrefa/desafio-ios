
struct PullRequest {
  
  var title: String
  var body: String
  var date: String
  var url: String
  var state: String
  var ownerNick: String
  var ownerAvatarUrl: String
  
  init(title: String, body: String, date: String, url: String, state: String, ownerNick: String, ownerAvatarUrl: String) {
    self.title = title
    self.body = body
    self.date = date
    self.url = url
    self.state = state
    self.ownerNick = ownerNick
    self.ownerAvatarUrl = ownerAvatarUrl
  }
  
}
