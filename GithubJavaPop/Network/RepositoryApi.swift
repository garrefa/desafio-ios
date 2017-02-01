
import Foundation

typealias completionRepositorySuccess = (_ repositoryViewModel: RepositoryViewModel) -> Void
typealias completionRepositoryFailure = (_ statusCode: Int, _ response: Any?, _ error: Error?) -> Void

class RepositoryApi {
  
  class func getRepositories(success: @escaping completionRepositorySuccess, failure: @escaping completionRepositoryFailure) {
    
    let url = "\(Bundle.main.apiEntrypoint)/search/repositories?q=language:Java&sort=stars&page=1"
    
    Api.request(method: .GET, url: url, success: { (statusCode, response) in
      let repository = RepositoryDecode.map(json: response)
      let repositoryViewModel = RepositoryViewModel(repository: repository)
      success(repositoryViewModel)
    }) { (statusCode, response, error) in
      failure(statusCode, response, error)
    }
  }
  
}
