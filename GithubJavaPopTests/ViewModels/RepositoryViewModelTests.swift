
import XCTest

class RepositoryViewModelTests: XCTestCase {
    
  override func setUp() {
    super.setUp()
  }
    
  override func tearDown() {
    super.tearDown()
  }
  
  func testRepositoryViewModel() {
    
    let arenaRepo = Repository(name: "Arena App", description: "Repository of Arena App", forks: 12938, favorites: 4875, ownerNick: "arena.im", ownerAvatarUrl: "http://arena.im/avatar.jpg")
    
    let repoViewModel = RepositoryViewModel(repository: arenaRepo)
    
    XCTAssertEqual("Arena App", repoViewModel.name)
    XCTAssertEqual("Repository of Arena App", repoViewModel.description)
    XCTAssertEqual("12938", repoViewModel.forks)
    XCTAssertEqual("4875", repoViewModel.favorites)
    XCTAssertEqual("arena.im", repoViewModel.ownerNick)
    XCTAssertEqual(URL(string: "http://arena.im/avatar.jpg"), repoViewModel.ownerAvatarUrl)
    
    XCTAssertNotEqual("Arena App iOS", repoViewModel.name)
    XCTAssertNotEqual("4876", repoViewModel.favorites)
    
  }
    
}
