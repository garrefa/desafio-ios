//
//  ProfileInfoView.swift
//  Test
//
//  Created by Bruno Wide on 16/02/20.
//  Copyright © 2020 BWide. All rights reserved.
//

import Foundation
import UIKit
import APIKit
import Kingfisher
import SnapKit

class ProfileInfoView: UIView, CodableView {
    
    // MARK: - Setup
    var user: User? {
        didSet {
            guard let user = user else { return }
            
            if let path = user.avatar_url, let url = URL(string: path) { avatarImageView.kf.setImage(with: url) }
            usernameLabel.text = user.login
            fullNameLabel.text = user.name
        }
    }
    
    var userLight: UserLight? {
        didSet {
            guard let userLight = userLight, user == nil else { return }
            
            if let path = userLight.avatar_url, let url = URL(string: path) { avatarImageView.kf.setImage(with: url) }
            usernameLabel.text = userLight.login
            fullNameLabel.text = ""
        }
    }
    
    enum Axis {
        case vertical, horizontal
    }
    
    var axis: Axis = .vertical {
        didSet {
            guard !constraints.isEmpty else { return }
            removeConstraints(constraints)
            setupConstraints()
        }
    }
    
    // MARK: - Views
    
    private(set) lazy var avatarImageView: UIImageView = {
        let ans = UIImageView()
        
        return ans
    }()
    
    private(set) lazy var usernameLabel: UILabel = {
       let ans = UILabel()
        
        ans.textColor = .blue
        
        return ans
    }()
    
    private(set) lazy var fullNameLabel: UILabel = {
       let ans = UILabel()
        
        ans.textColor = .lightGray
        
        return ans
    }()
    
    // MARK: - Constraints
    
    func setupViewHierarchy() {
        addSubview(avatarImageView)
        addSubview(usernameLabel)
        addSubview(fullNameLabel)
    }
    
    func setupConstraints() {
        setupConstraints(for: axis)
        avatarImageView.setContentCompressionResistancePriority(.defaultLow, for: .vertical)
        usernameLabel.setContentCompressionResistancePriority(.required, for: .vertical)
        fullNameLabel.setContentCompressionResistancePriority(.required, for: .vertical)
    }
    
    func additionalSetup() {
        usernameLabel.adjustsFontSizeToFitWidth = true
        [usernameLabel, fullNameLabel].forEach {
            $0.textAlignment = axis == .horizontal ? .left : .center
        }
    }
    
    private func setupConstraints(for axis: Axis) {
        switch axis {
        case .horizontal:
            avatarImageView.snp.makeConstraints { maker in
                maker.top.equalToSuperview()
                maker.bottom.equalToSuperview()
                maker.left.equalToSuperview()
                maker.width.equalTo(avatarImageView.snp.height)
                maker.width.lessThanOrEqualTo(50)
            }
            
            usernameLabel.snp.makeConstraints { maker in
                maker.top.equalTo(avatarImageView.snp.top)
                maker.left.equalTo(avatarImageView.snp.right).offset(2)
                maker.right.equalToSuperview()
            }
            
            fullNameLabel.snp.makeConstraints { maker in
                maker.top.equalTo(usernameLabel.snp.bottom).offset(1)
                maker.left.equalTo(usernameLabel.snp.left)
                maker.right.equalTo(usernameLabel.snp.right)
                maker.bottom.equalTo(avatarImageView.snp.bottom)
            }
        case .vertical:
            avatarImageView.snp.makeConstraints { maker in
                maker.top.equalToSuperview()
                maker.left.equalToSuperview()
                maker.right.equalToSuperview()
                maker.width.equalTo(avatarImageView.snp.height)
            }
            
            usernameLabel.snp.makeConstraints { maker in
                maker.top.equalTo(avatarImageView.snp.bottom).offset(2)
                maker.left.equalToSuperview()
                maker.right.equalToSuperview()
            }
            
            fullNameLabel.snp.makeConstraints { maker in
                maker.top.equalTo(usernameLabel.snp.bottom).offset(1)
                maker.left.equalToSuperview()
                maker.right.equalToSuperview()
                maker.bottom.equalToSuperview()
            }
        }
    }
}
