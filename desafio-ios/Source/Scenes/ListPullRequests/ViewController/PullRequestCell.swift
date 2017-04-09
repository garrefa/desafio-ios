//
//  PullRequestCell.swift
//  desafio-ios
//
//  Created by Cicero Camargo on 09/04/17.
//  Copyright © 2017 Stationfy. All rights reserved.
//

import UIKit

class PullRequestCell: UITableViewCell {

    static let estimatedRowHeight: CGFloat = 130
    
    // Outlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var authorProfilePictureImageView: AsyncImageView!
    @IBOutlet weak var authorUserNameLabel: UILabel!
    @IBOutlet weak var authorDisplayNameLabel: UILabel!
    
    func load(from pullRequest: ListPullRequests.ViewModel.PullRequest) {
        titleLabel.text = pullRequest.title
        dateLabel.text = pullRequest.dateInfo
        descriptionLabel.text = pullRequest.description
        authorUserNameLabel.text = pullRequest.author.userName
        authorDisplayNameLabel.text = pullRequest.author.displayName
        if let url = pullRequest.author.profilePictureURL {
            authorProfilePictureImageView.loadImageFromUrl(url)
        } else {
            authorProfilePictureImageView.image = R.image.userProfilePicturePlaceholder()
        }
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        authorProfilePictureImageView.image = nil
    }
}
