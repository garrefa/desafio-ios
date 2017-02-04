//
//  RepositoryTableViewCell.swift
//  GitHub
//
//  Created by Juliana Lacerda on 03/02/17.
//  Copyright © 2017 Juliana Lacerda. All rights reserved.
//

import UIKit
import AlamofireImage

class RepositoryTableViewCell: UITableViewCell {

    @IBOutlet weak var nameRepository: UILabel!
    @IBOutlet weak var descriptionRepository: UILabel!
    @IBOutlet weak var countForks: UILabel!
    @IBOutlet weak var countStars: UILabel!
    
    @IBOutlet weak var avatarOwner: UIImageView!
    @IBOutlet weak var loginOwner: UILabel!
    @IBOutlet weak var fullnameOwner: UILabel!
    
    func setData(repository:RepositoryEntity) {
        
        nameRepository.text = repository.name
        descriptionRepository.text = repository.descript
        
        countForks.text = "\(repository.forksNum!)"
        countStars.text = "\(repository.startsNum!)"
        
        let owner = repository.owner!
        
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
