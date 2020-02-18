//
//  RepositoryTableViewCell.swift
//  TesteArenaFelipePerius
//
//  Created by Felipe perius on 16/02/20.
//  Copyright © 2020 Felipe Perius. All rights reserved.
//

import UIKit
import SDWebImage

class RepositoryTableViewCell: UITableViewCell {

    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var numberForks: UILabel!
    @IBOutlet weak var titleRepository: UILabel!
    @IBOutlet weak var descriptionRepository: UILabel!
    @IBOutlet weak var numberStars: UILabel!
    @IBOutlet weak var fullName: UILabel!
    @IBOutlet weak var forkImageView: UIImageView!
    @IBOutlet weak var starImageView: UIImageView!
    @IBOutlet weak var photoUser: UIImageView!
    
    static let identifier: String = "RepositoryTableViewCell"
    
    static var cellHeight: CGFloat {
        return 140
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        self.setupViewCell()
    }
    
    func setupCell(respository:Repository) {
        
        if let owner = respository.owner {
            usernameLabel.text = owner.name
            if let avatarUrl = owner.avatarUrl{
                self.loadImageView(url:avatarUrl)
            }
        }
        
        titleRepository.text = respository.name
        descriptionRepository.text = respository.description
        fullName.text = respository.fullName
        
        if let countForks = respository.forksCount {
             numberForks.text = "\(countForks)"
        }
        
        if let starsCount = respository.starsCount {
            numberStars.text = "\(starsCount)"
        }
       
     }
    
    func setupViewCell(){
        let image = UIImage(named: "ic_fork")!.withRenderingMode(.alwaysTemplate)
        forkImageView.image = image
        forkImageView.tintColor = UIColor.taOrange
        
        photoUser.layer.cornerRadius = photoUser.frame.size.width / 2
        photoUser.clipsToBounds = true
    }
    
    func loadImageView(url:String){
        photoUser.sd_setImage(with: URL(string:url), placeholderImage: UIImage(named: "photo_user"))
    }
    
}
