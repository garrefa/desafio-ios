
import Foundation

typealias completionPRSuccess = (_ pullRequestViewModel: [PullRequestViewModel]) -> Void
typealias completionPRFailure = (_ statusCode: Int, _ response: Any?, _ error: Error?) -> Void

class PullRequestApi: Api {
  
  class func getPullRequests(owner: String, repository: String, success: @escaping completionPRSuccess, failure: @escaping completionPRFailure) {
    
    let url = "\(Bundle.main.apiEntrypoint)/repos/\(owner)/\(repository)/pulls"
    
    super.request(method: .GET, url: url, success: { (statusCode, response) in
      
      var pullRequestsViewModel = [PullRequestViewModel]()
      let itemsArray = response.object.array
      
      guard itemsArray != nil else {
        success([])
        return
      }
      
      let items = JSONSerializer(itemsArray!)
      
      for item in items.object {
        let json = JSONSerializer(item.1.object)
        let pullRequest = PullRequestDecode.map(json: json)
        let pullRequestViewModel = PullRequestViewModel(pullRequest: pullRequest)
        pullRequestsViewModel.append(pullRequestViewModel)
      }
      
      success(pullRequestsViewModel)
      
    }) { (statusCode, response, error) in
      
      failure(statusCode, response, error)
      
    }
  }
  
}
