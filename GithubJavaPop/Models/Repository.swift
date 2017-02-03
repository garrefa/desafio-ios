
struct Repository {

  var name: String
  var description: String
  var forks: Int
  var favorites: Int
  var ownerNick: String
  var ownerAvatarUrl: String
  
  init(name: String, description: String, forks: Int, favorites: Int, ownerNick: String, ownerAvatarUrl: String) {
    self.name = name
    self.description = description
    self.forks = forks
    self.favorites = favorites
    self.ownerNick = ownerNick
    self.ownerAvatarUrl = ownerAvatarUrl
  }
  
}
