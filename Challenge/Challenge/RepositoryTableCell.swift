//
//  RepositoryTableCell.swift
//  Challenge
//
//  Created by Gustavo Henrique on 15/04/17.
//  Copyright © 2017 Gustavo Henrique. All rights reserved.
//


import UIKit
import SDWebImage

class RepositoryTableCell: UITableViewCell {
    
    @IBOutlet weak var avatarPhotoImage: UIImageView!
    @IBOutlet weak var avatarUserLabel: UILabel!
    @IBOutlet weak var avatarNameLabel: UILabel!
    @IBOutlet weak var forkImage: UIImageView!
    @IBOutlet weak var forkCountLabel: UILabel!
    @IBOutlet weak var starImage: UIImageView!
    @IBOutlet weak var starsCountLabel: UILabel!
    @IBOutlet weak var repositoryNameLabel: UILabel!
    @IBOutlet weak var repositoryDescriptionLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configCell(repository: Repository) {
        
        self.avatarPhotoImage.sd_setImage(with: URL(string: repository.owner.avatarPhotoUrl!), placeholderImage: UIImage(named: "user.png"))
        self.avatarPhotoImage.roundToCircle()
        self.avatarNameLabel.text = repository.owner.login
        self.avatarUserLabel.text = repository.fullName
        self.forkCountLabel.text = "\(repository.forks_count!)"
        self.starsCountLabel.text = "\(repository.stars_count!)"
        self.repositoryNameLabel.text = repository.name
        self.repositoryDescriptionLabel.text = repository.descript
        
    }

}
