//
//  PullRequestTableViewCell.swift
//  Desafio iOS
//
//  Created by João Pedro Souza on 30/01/17.
//  Copyright © 2017 Arena. All rights reserved.
//

import UIKit
import Kingfisher
import SwiftyUtils


class PullRequestTableViewCell: UITableViewCell {

  // MARK: IBOutelts
  
  @IBOutlet weak var labelPullRequestTitle: UILabel!
  @IBOutlet weak var labelPullRequestDescription: UILabel!
  @IBOutlet weak var labelLogin: UILabel!
  @IBOutlet weak var labelDate: UILabel!
  @IBOutlet weak var imageViewAvatar: RoundedImageView!
  
  // MARK: Members
  
  var pullRequest: PullRequest? = nil {
    didSet {
      if let pullRequest = pullRequest {
        
        labelPullRequestTitle.text = pullRequest.title
        labelPullRequestDescription.text = pullRequest.body
        labelLogin.text = pullRequest.user.login
        
        labelDate.text = pullRequest.createdAt.toString(format: "dd/MM/yyyy")
        
        let url = URL(string: pullRequest.user.avatarURL)
        imageViewAvatar.kf.setImage(with: url , placeholder: R.image.ic_userPlaceholder(), options: nil, progressBlock: nil, completionHandler: nil)
      }
    }
  }
  
  // MARK: Lifecycle
  
  override func awakeFromNib() {
    super.awakeFromNib()
  }

}
