
class RepositoryDecode {
  
  class func map(json: JSONSerializer) -> Repository {
    
    let name = json.object["name"].stringValue
    let description = json.object["description"].stringValue
    let forks = json.object["forks_count"].intValue
    let favorites = json.object["stargazers_count"].intValue
    let ownerNick = json.object["owner"]["login"].stringValue
    let ownerAvatarUrl = json.object["owner"]["avatar_url"].stringValue
    
    return Repository(name: name, description: description, forks: forks, favorites: favorites, ownerNick: ownerNick, ownerAvatarUrl: ownerAvatarUrl)
    
  }
  
}
