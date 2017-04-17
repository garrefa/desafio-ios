//
//  DetailRepositoryTableCell.swift
//  Challenge
//
//  Created by Gustavo Henrique on 15/04/17.
//  Copyright © 2017 Gustavo Henrique. All rights reserved.
//


import UIKit

class DetailRepositoryTableCell: UITableViewCell {

    @IBOutlet weak var titlePullRequestLabel: UILabel!
    @IBOutlet weak var descriptionPullRequestLabel: UILabel!
    @IBOutlet weak var avatarPhotoImage: UIImageView!
    @IBOutlet weak var avatarUserLabel: UILabel!
    @IBOutlet weak var avatarUserNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configCell(pullRequest: PullRequest){
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ" // Formato padrão de retorno da api do Github
        
        let dateOriginal = formatter.date(from: pullRequest.create_at)!
        formatter.dateFormat = "dd-MM-yyyy" // Formatando data pro padrão BR
        
        self.avatarPhotoImage.sd_setImage(with: URL(string: pullRequest.user.avatarPhotoUrl!), placeholderImage:
            UIImage(named: "user.png"))
        self.avatarPhotoImage.roundToCircle()
        self.avatarUserLabel.text = pullRequest.user.login
        self.avatarUserNameLabel.text = formatter.string(from: dateOriginal)
        self.titlePullRequestLabel.text = pullRequest.title
        self.descriptionPullRequestLabel.text = pullRequest.body
    }

}
