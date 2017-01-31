
import Alamofire

public enum HttpVerbs: String {
  case GET, POST, PUT, PATCH, DELETE
}

public enum StatusCodes: Int {
  case Unauthorized = 401
  case NotFound = 404
  case Conflict = 409
  case Success = 200
}

typealias completionApiSuccess = (_ statusCode: Int, _ response: Any?) -> Void
typealias completionApiFailure = (_ statusCode: Int, _ response: Any?, _ error: Error?) -> Void

class Api {
  
  private class func requestAlamofire(method: HttpVerbs, url: String, parameters: [String : AnyObject]?, success: @escaping completionApiSuccess, failure: @escaping completionApiFailure) {
    
    guard Reachability.isConnected() else {
      Alert.connectionError()
      return
    }

    let alamofireMethod = Alamofire.HTTPMethod(rawValue: method.rawValue)!
    
    Alamofire.request(url, method: alamofireMethod, parameters: parameters, encoding: JSONEncoding.default, headers: ["Accept" : "application/json"])
      .validate(contentType: ["application/json"])
      .responseJSON { response in
        
        let value = response.result.value
        let code = response.response?.statusCode
        
        switch response.result {
          case .success:
            success(code!, value!)
          case .failure(let error):
            failure(code!, value!, error)
        }
        
    }
    
  }
  
  
  // MARK: - Request With Parameters
  
  class func request(method: HttpVerbs, url: String, parameters: [String : AnyObject]?, joinAuthToken: Bool = true, success: @escaping completionJSONSuccess, failure: @escaping completionJSONFailure) {
    
    self.requestAlamofire(method: method, url: url, parameters: parameters, success: { (statusCode, response) in
      
      if let value = response {
        success(_: statusCode, JSONSerializer(value))
      } else {
        failure(statusCode, response, nil)
      }
      
    }) { (statusCode, response, error) in
      failure(statusCode, nil, error)
    }
    
  }
  
  
  // MARK: - Request Without Parameters
  
  class func request(method: HttpVerbs, url: String, success: @escaping completionJSONSuccess, failure: @escaping completionJSONFailure) {
    self.request(method: method, url: url, parameters: nil, success: success, failure: failure)
  }
  
}
