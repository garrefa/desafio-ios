//
//  RepositoryTableViewCell.swift
//  TesteArenaFelipePerius
//
//  Created by Felipe perius on 16/02/20.
//  Copyright © 2020 Felipe Perius. All rights reserved.
//

import UIKit

class RepositoryTableViewCell: UITableViewCell {

    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var numberForks: UILabel!
    @IBOutlet weak var titleRepository: UILabel!
    @IBOutlet weak var descriptionRepository: UILabel!
    @IBOutlet weak var numberStars: UILabel!
    @IBOutlet weak var fullName: UILabel!
    @IBOutlet weak var forkImageView: UIImageView!
    @IBOutlet weak var starImageView: UIImageView!
    
    static let identifier: String = "RepositoryTableViewCell"
    
    static var cellHeight: CGFloat {
        return 140
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
    
    func setupCell(respository:Repository) {
        
        if let owner = respository.owner {
            usernameLabel.text = owner.name
        }
        
        titleRepository.text = respository.name
        descriptionRepository.text = respository.description
        
        if let countForks = respository.forksCount {
             numberForks.text = "\(countForks)"
        }
        
        if let starsCount = respository.starsCount {
            numberStars.text = "\(starsCount)"
        }
     }
    
}
