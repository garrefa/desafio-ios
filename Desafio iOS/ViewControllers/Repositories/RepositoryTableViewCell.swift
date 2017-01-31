//
//  RepositoryTableViewCell.swift
//  Desafio iOS
//
//  Created by João Pedro Souza on 30/01/17.
//  Copyright © 2017 Arena. All rights reserved.
//

import UIKit
import Kingfisher

class RepositoryTableViewCell: UITableViewCell {

  // MARK: IBOutlets
  
  @IBOutlet weak var labelRepositoryName: UILabel!
  @IBOutlet weak var labelRepositoryDescription: UILabel!
  @IBOutlet weak var labelNumberOfForks: UILabel!
  @IBOutlet weak var labelNumberOfStars: UILabel!
  @IBOutlet weak var labelLoginName: UILabel!
  @IBOutlet weak var imageViewOwnerAvatar: RoundedImageView!
  
  // MARK: Members
  
  var repository: Repository? = nil {
    didSet {
      if let repository = repository {
        labelRepositoryName.text = repository.name
        labelRepositoryDescription.text = repository.respositoryDescription
        labelNumberOfForks.text = "\(repository.forksCount!)"
        labelNumberOfStars.text = "\(repository.stargazersCount!)"
        labelLoginName.text = repository.owner.login
        
        let url = URL(string: repository.owner.avatarURL)
        imageViewOwnerAvatar.kf.setImage(with: url , placeholder: R.image.ic_userPlaceholder(), options: nil, progressBlock: nil, completionHandler: nil)
      }
    }
  }
  
  // MARK: Lifecycle
  
  override func awakeFromNib() {
    super.awakeFromNib()
  }
  
}
