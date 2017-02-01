
import Foundation

class RepositoryViewModel {
  
  private var repository: Repository
  
  var name: String {
    return self.repository.name
  }
  
  var description: String {
    return self.repository.description
  }
  
  var forks: Int {
    return self.repository.forks
  }
  
  var favorites: Int {
    return self.repository.favorites
  }
  
  var ownerNick: String {
    return self.repository.ownerNick
  }
  
  var ownerAvatarUrl: String {
    return self.repository.ownerAvatarUrl
  }
  
  init(repository: Repository) {
    self.repository = repository
  }
  
}
