//
//  ListPullRequestsRouter.swift
//  desafio-ios
//
//  Created by Cicero Camargo on 09/04/17.
//  Copyright (c) 2017 Stationfy. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so you can apply
//  clean architecture to your iOS and Mac projects, see http://clean-swift.com
//

import UIKit

/// Interface provided by a router that navigates from ListPullRequestsViewController to other scenes
protocol ListPullRequestsRouter {
    
    /// shows details for the last pull request selected on the view controller
    func showPullRequestDetail()
}
