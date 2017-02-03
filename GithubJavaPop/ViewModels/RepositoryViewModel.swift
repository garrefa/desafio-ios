
import Foundation

class RepositoryViewModel {
  
  private var repository: Repository
  
  var name: String {
    return self.repository.name
  }
  
  var description: String {
    return self.repository.description
  }
  
  var forks: String {
    return String(self.repository.forks)
  }
  
  var favorites: String {
    return String(self.repository.favorites)
  }
  
  var ownerNick: String {
    return self.repository.ownerNick
  }
  
  var ownerAvatarUrl: URL {
    return URL(string: self.repository.ownerAvatarUrl)!
  }
  
  init(repository: Repository) {
    self.repository = repository
  }
  
}
