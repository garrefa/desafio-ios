
import Foundation

typealias completionRepositorySuccess = (_ repositoriesViewModel: [RepositoryViewModel]) -> Void
typealias completionRepositoryFailure = (_ statusCode: Int, _ response: Any?, _ error: Error?) -> Void

class RepositoryApi: Api {
  
  class func getRepositories(page: Int, success: @escaping completionRepositorySuccess, failure: @escaping completionRepositoryFailure) {
    
    let url = "\(Bundle.main.apiEntrypoint)/search/repositories?q=language:Java&sort=stars&page=\(page)"
    
    super.request(method: .GET, url: url, success: { (statusCode, response) in
      
      var repositoriesViewModel = [RepositoryViewModel]()
      let itemsArray = response.object["items"].array
      
      guard itemsArray != nil else {
        success([])
        return
      }
        
      let items = JSONSerializer(itemsArray!)
      
      for item in items.object {
        let json = JSONSerializer(item.1.object)
        let repository = RepositoryDecode.map(json: json)
        let repositoryViewModel = RepositoryViewModel(repository: repository)
        repositoriesViewModel.append(repositoryViewModel)
      }
      
      success(repositoriesViewModel)
      
    }) { (statusCode, response, error) in
      
      failure(statusCode, response, error)
      
    }
  }
  
}
