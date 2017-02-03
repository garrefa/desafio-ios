
import Alamofire

typealias completionApiSuccess = (_ statusCode: Int, _ response: Any?) -> Void
typealias completionApiFailure = (_ statusCode: Int, _ response: Any?, _ error: Error?) -> Void

class Api {
  
  enum httpVerbs: String {
    case GET, POST, PUT, PATCH, DELETE
  }
  
  enum statusCodes: Int {
    case disconnected = 12163
  }
  
  fileprivate class func requestAlamofire(method: httpVerbs, url: String, parameters: [String : AnyObject]?, success: @escaping completionApiSuccess, failure: @escaping completionApiFailure) {
    
    guard Reachability.isConnected() else {
      failure(statusCodes.disconnected.rawValue, nil, nil)
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
  
  class func request(method: httpVerbs, url: String, parameters: [String : AnyObject]?, joinAuthToken: Bool = true, success: @escaping completionJSONSuccess, failure: @escaping completionJSONFailure) {
    
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
  
  class func request(method: httpVerbs, url: String, success: @escaping completionJSONSuccess, failure: @escaping completionJSONFailure) {
    self.request(method: method, url: url, parameters: nil, success: success, failure: failure)
  }
  
}
