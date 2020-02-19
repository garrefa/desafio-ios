//
//  ServiceManager.swift
//  TesteArenaFelipePerius
//
//  Created by Felipe perius on 17/02/20.
//  Copyright © 2020 Felipe Perius. All rights reserved.
//

import UIKit
import Alamofire

class ServiceManager: NSObject {
    static var defaultClient : Alamofire.Session = {
        // Create custom manager
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = .none
        let man = Alamofire.Session(
            configuration: URLSessionConfiguration.default
        )
        return man
    }()
}
