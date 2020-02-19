//
//  PullRequestTableViewCell.swift
//  TesteArenaFelipePerius
//
//  Created by Felipe perius on 18/02/20.
//  Copyright © 2020 Felipe Perius. All rights reserved.
//

import UIKit
import SDWebImage

class PullRequestTableViewCell: UITableViewCell {
    @IBOutlet weak var titlePullRequest: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    
    static let identifier: String = "PullRequestTableViewCell"
     
     static var cellHeight: CGFloat {
         return 140
     }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        self.setupViewCell()
    }
    
   func setupCell(pullRequest:PullRequest) {
        if let user = pullRequest.user {
            usernameLabel.text = user.name
            if let avatarUrl = user.avatarUrl {
                self.loadImageView(url:avatarUrl)
            }
        }
        fullNameLabel.text = pullRequest.fullName
        titlePullRequest.text = pullRequest.title
        descriptionLabel.text = pullRequest.body
    }
    
    func setupViewCell(){
        photoImageView.layer.cornerRadius = photoImageView.frame.size.width / 2
        photoImageView.clipsToBounds = true
    }
    
    func loadImageView(url:String){
        photoImageView.sd_setImage(with: URL(string:url), placeholderImage: UIImage(named: "photo_user"))
    }
    
}
