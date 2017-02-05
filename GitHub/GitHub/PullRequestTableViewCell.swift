//
//  PullRequestTableViewCell.swift
//  GitHub
//
//  Created by Juliana Lacerda on 03/02/17.
//  Copyright © 2017 Juliana Lacerda. All rights reserved.
//

import UIKit

class PullRequestTableViewCell: UITableViewCell {

    @IBOutlet weak var titlePullRequest: UILabel!
    @IBOutlet weak var datePullRequest: UILabel!
    @IBOutlet weak var bodyPullRequest: UILabel!
    
    @IBOutlet weak var loginOwner: UILabel!
    @IBOutlet weak var avatarOwner: UIImageView!
    @IBOutlet weak var fullnameOwner: UILabel!
    
    func setData(pullRequest:PullRequestEntidy) {
        
        titlePullRequest.text = pullRequest.title
        datePullRequest.text = pullRequest.createdDateString
        bodyPullRequest.text = pullRequest.body
        
        let owner = pullRequest.user!
        
        avatarOwner.image = UIImage()
        
        avatarOwner.af_setImage(
            withURL: owner.avatarUrl!,
            placeholderImage: nil,
            filter: nil,
            imageTransition: .crossDissolve(0.2)
        )
        
        avatarOwner.setRounded()
        
        loginOwner.text = owner.login
        
        owner.getFullname { (OwnerEntidy) in
            self.fullnameOwner.text = OwnerEntidy.name
        }
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
