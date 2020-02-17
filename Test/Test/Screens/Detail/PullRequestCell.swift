//
//  PullRequestCell.swift
//  Test
//
//  Created by Bruno Wide on 16/02/20.
//  Copyright © 2020 BWide. All rights reserved.
//

import Foundation
import UIKit
import SnapKit
import APIKit

final class PullRequestCell: TestTableViewCell {
    
    // MARK: - Properties
    
    private(set) lazy var titleLabel: UILabel = {
       let ans = UILabel()
        
        ans.textAlignment = .left
        ans.numberOfLines = 1
        ans.textColor = .blue
        
        return ans
    }()
    
    private(set) lazy var descriptionLabel: UILabel = {
       let ans = UILabel()
        
        ans.textAlignment = .left
        ans.numberOfLines = 2
        
        return ans
    }()
    
    private(set) lazy var profileView: ProfileInfoView = {
       let ans = ProfileInfoView()
        
        ans.axis = .horizontal
        
        return ans
    }()
    
    
    // MARK: - Setup
    var pullRequest: PullRequest? {
        didSet {
            guard let pullRequest = pullRequest else { return }
            
            titleLabel.text = pullRequest.title
            descriptionLabel.text = pullRequest.body
            profileView.userLight = pullRequest.user
        }
    }
    
    // MARK: - CodableView
    
    override func setupViewHierarchy() {
        addSubview(titleLabel)
        addSubview(descriptionLabel)
        addSubview(profileView)
    }
    
    override func setupConstraints() {
        titleLabel.snp.makeConstraints { maker in
            maker.top.equalToSuperview().offset(16)
            maker.left.equalToSuperview().offset(16)
            maker.right.equalToSuperview().inset(16)
        }
        
        descriptionLabel.snp.makeConstraints { maker in
            maker.top.equalTo(titleLabel.snp.bottom).offset(4)
            maker.left.equalTo(titleLabel.snp.left)
            maker.right.equalTo(titleLabel.snp.right)
            
        }
        
        profileView.snp.makeConstraints { maker in
            maker.top.equalTo(descriptionLabel.snp.bottom).offset(2)
            maker.bottom.equalToSuperview().inset(8)
            maker.left.equalTo(titleLabel.snp.left)
            maker.right.equalTo(descriptionLabel.snp.right)
        }
    }
}
