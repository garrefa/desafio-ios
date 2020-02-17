//
//  APIManager.swift
//  Improving
//
//  Created by Bruno Wide on 29/11/19.
//  Copyright © 2019 BWide. All rights reserved.
//

import Foundation
import Network
import Alamofire

class APIManager {
    
    // MARK: - Properties
    
    static let `default` = APIManager()
    private let basePath = "https://api.github.com"
    private var isConnected = true
    
    // MARK: - Initializer
    
    private init() {}
    
    // MARK: - Public
    
    func hasInternetConnection() -> Bool {
        return isConnected
    }
    
    func performNoReturn<T: RequestNoReturn>(_ request: T, completion: @escaping (Result<Void>) -> Void) {
        guard let task = urlRequest(with: request) else { return }
        
        task.response { response in
            if let error = response.error {
                completion(.failure(error))
            } else {
                completion(.success(()))
            }
        }
    }
    
    func perform<T: Request>(_ request: T, completion: @escaping (Result<T.ReturnType>) -> Void) {
        guard let task = urlRequest(with: request) else { return }
            
        task.responseJSON { response in
            print("RESPONSE:")
            print(response)
            
            guard let data = response.data else { completion(.failure(NoResponseData())); return }
            
            do {
                let object = try JSONDecoder().decode(T.ReturnType.self, from: data)
                
                DispatchQueue.main.async { completion(.success(object)) }
            } catch let error {
                DispatchQueue.main.async {
                    print("ERROR:")
                    print(error)
                    completion(.failure(error))
                }
            }
            
        }
    }
    
    func urlRequest<T: RequestNoReturn>(with request: T) -> DataRequest? {
        guard isConnected else { return nil }
        let fullPath = "\(basePath)\(request.path)"
        
        guard let encoded = fullPath.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed), let url = URL(string: encoded) else {
            fatalError("🛑 URL not well formed")
        }
        
        let ans = Alamofire.request(url, method: request.method, parameters: request.body, encoding: URLEncoding.default)
        
        print("GET: \(ans.request?.url?.description ?? "urlNotFound")")
        
        return ans
    }
}
