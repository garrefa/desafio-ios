
class PullRequestDecode {
  
  class func map(json: JSONSerializer) -> PullRequest {
    
    let title = json.object["title"].stringValue
    let body = json.object["body"].stringValue
    let date = json.object["created_at"].stringValue
    let url = json.object["html_url"].stringValue
    let state = json.object["state"].stringValue
    let ownerNick = json.object["user"]["login"].stringValue
    let ownerAvatarUrl = json.object["user"]["avatar_url"].stringValue
    
    return PullRequest(title: title, body: body, date: date, url: url, state: state, ownerNick: ownerNick, ownerAvatarUrl: ownerAvatarUrl)
    
  }
  
}
