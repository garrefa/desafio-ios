//
//  RepositoryCell.swift
//  desafio-ios
//
//  Created by Cicero Camargo on 08/04/17.
//  Copyright © 2017 Stationfy. All rights reserved.
//

import UIKit
import SDWebImage

class RepositoryCell: UITableViewCell {

    static let estimatedRowHeight: CGFloat = 136
    
    // Outlets
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var forksLabel: UILabel!
    @IBOutlet weak var starsLabel: UILabel!
    @IBOutlet weak var ownerProfilePictureImageView: UIImageView!
    @IBOutlet weak var ownerUserNameLabel: UILabel!
    @IBOutlet weak var ownerDisplayNameLabel: UILabel!
    
    func load(from repository: ListRepositories.ViewModel.Repository) {
        nameLabel.text = repository.name
        descriptionLabel.text = repository.description
        forksLabel.text = repository.forks
        starsLabel.text = repository.stars
        ownerUserNameLabel.text = repository.owner.userName
        ownerDisplayNameLabel.text = repository.owner.displayName
        
        let placeholder = R.image.userProfilePicturePlaceholder()
        if let url = repository.owner.profilePictureURL {
            ownerProfilePictureImageView.sd_setImage(with: url, placeholderImage: placeholder)
        } else {
            ownerProfilePictureImageView.image = placeholder
        }
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        ownerProfilePictureImageView.image = nil
    }
}
