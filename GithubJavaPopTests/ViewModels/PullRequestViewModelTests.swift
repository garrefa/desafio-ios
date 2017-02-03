
import XCTest

class PullRequestViewModelTests: XCTestCase {
  
  override func setUp() {
    super.setUp()
  }
  
  override func tearDown() {
    super.tearDown()
  }
  
  func testPullRequestViewModel() {
    
    let arenaPR = PullRequest(title: "feature/video", body: "video framework changed", date: "2017-02-03T01:35:00Z", url: "http://arena.im/pr-video", state: "open", ownerNick: "arena.im", ownerAvatarUrl: "http://arena.im/av.png")
    
    let prViewModel = PullRequestViewModel(pullRequest: arenaPR)
    
    XCTAssertEqual("feature/video", prViewModel.title)
    XCTAssertEqual("video framework changed", prViewModel.body)
    XCTAssertEqual("qui, 2 fev 2017, 23:35", prViewModel.date)
    XCTAssertEqual(URL(string: "http://arena.im/pr-video"), prViewModel.url)
    XCTAssertEqual(PullRequestViewModel.prState.open, prViewModel.state)
    XCTAssertEqual("arena.im", prViewModel.ownerNick)
    XCTAssertEqual(URL(string: "http://arena.im/av.png"), prViewModel.ownerAvatarUrl)
    
    XCTAssertNotEqual("2017-02-03T01:35:00Z", prViewModel.date)
    
  }
  
  func testTotalStates() {
    
    let arenaPR1 = PullRequest(title: "feature/video", body: "video framework changed", date: "2017-02-03T01:35:00Z", url: "http://arena.im/pr-video", state: "open", ownerNick: "arena.im", ownerAvatarUrl: "http://arena.im/av.png")
    
    let prViewModel1 = PullRequestViewModel(pullRequest: arenaPR1)
    
    let arenaPR2 = PullRequest(title: "feature/image", body: "image framework changed", date: "2017-01-03T01:35:00Z", url: "http://arena.im/pr-image", state: "closed", ownerNick: "arena.im", ownerAvatarUrl: "http://arena.im/av.png")
    
    let prViewModel2 = PullRequestViewModel(pullRequest: arenaPR2)
    
    let attributedString = PullRequestViewModel.totalStates([prViewModel1, prViewModel2])
    
    let attributes = [[
      "attributes": [
        NSFontAttributeName: StyleGuide.Font.Number.value,
        NSForegroundColorAttributeName: StyleGuide.Color.Orange.value
      ],
      "location": 0,
      "length": 9
      ],[
        "attributes": [
          NSFontAttributeName: StyleGuide.Font.Number.value,
          NSForegroundColorAttributeName: StyleGuide.Color.Black.value
        ],
        "location": 9,
        "length": 0
      ]]
    
    let attributedStringTest = "1 opened / 1 closed".attributedWithRange(attributes)
    let attributedStringNotTest = "1 opened / 2 closed".attributedWithRange(attributes)
    
    XCTAssertEqual(attributedStringTest, attributedString)
    XCTAssertNotEqual(attributedStringNotTest, attributedString)
    
  }
  
}
