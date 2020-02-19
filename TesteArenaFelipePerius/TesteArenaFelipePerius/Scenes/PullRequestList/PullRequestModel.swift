//
//  PullRequestModel.swift
//  TesteArenaFelipePerius
//
//  Created by Felipe perius on 18/02/20.
//  Copyright © 2020 Felipe Perius. All rights reserved.
//

import UIKit

enum PullRequestModel {
    struct Response {
         var pullRequests: [PullRequest]?
         var isError: Bool
         var messageError: String?
     }
}
