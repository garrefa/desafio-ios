//
//  PullRequestCell.swift
//  desafio-ios
//
//  Created by Cicero Camargo on 09/04/17.
//  Copyright © 2017 Stationfy. All rights reserved.
//

import UIKit
import SDWebImage

class PullRequestCell: UITableViewCell {

    static let estimatedRowHeight: CGFloat = 130
    
    // Outlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var authorProfilePictureImageView: UIImageView!
    @IBOutlet weak var authorUserNameLabel: UILabel!
    @IBOutlet weak var authorDisplayNameLabel: UILabel!
    
    func load(from pullRequest: ListPullRequests.ViewModel.PullRequest) {
        titleLabel.text = pullRequest.title
        dateLabel.text = pullRequest.dateInfo
        descriptionLabel.text = pullRequest.description
        authorUserNameLabel.text = pullRequest.author.userName
        authorDisplayNameLabel.text = pullRequest.author.displayName
        
        let placeholder = R.image.userProfilePicturePlaceholder()
        if let url = pullRequest.author.profilePictureURL {
            authorProfilePictureImageView.sd_setImage(with: url, placeholderImage: placeholder)
        } else {
            authorProfilePictureImageView.image = placeholder
        }
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        authorProfilePictureImageView.image = nil
    }
}
