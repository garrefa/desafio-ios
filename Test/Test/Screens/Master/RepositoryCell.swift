import Foundation
import UIKit
import SnapKit
import APIKit

final class RepositoryCell: TestTableViewCell {
    
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
    
    private(set) lazy var forksCountLabel: UILabel = {
       let ans = UILabel()
        
        ans.numberOfLines = 1
        ans.textColor = .lightGray
        
        return ans
    }()
    
    private(set) lazy var starsCountLabel: UILabel = {
       let ans = UILabel()
        
        ans.numberOfLines = 1
        ans.textColor = .lightGray
        
        return ans
    }()
    
    private(set) lazy var profileView: ProfileInfoView = {
       let ans = ProfileInfoView()
        
        ans.axis = .vertical
        
        return ans
    }()
    
    
    // MARK: - Setup
    var repository: Repository? {
        didSet {
            guard let repository = repository else { return }
            
            titleLabel.text = repository.name
            descriptionLabel.text = repository.description
            forksCountLabel.text = "forks: \(repository.forks_count ?? 0)"
            starsCountLabel.text = "stars: \(repository.stargazers_count ?? 0)"
            profileView.userLight = repository.owner
        }
    }
    
    // MARK: - CodableView
    
    override func setupViewHierarchy() {
        addSubview(titleLabel)
        addSubview(descriptionLabel)
        addSubview(forksCountLabel)
        addSubview(starsCountLabel)
        addSubview(profileView)
    }
    
    override func setupConstraints() {
        titleLabel.snp.makeConstraints { maker in
            maker.top.equalToSuperview().offset(16)
            maker.left.equalToSuperview().offset(16)
        }
        
        descriptionLabel.snp.makeConstraints { maker in
            maker.top.equalTo(titleLabel.snp.bottom).offset(4)
            maker.left.equalTo(titleLabel.snp.left)
            maker.right.equalTo(titleLabel.snp.right)
        }
        
        profileView.snp.makeConstraints { maker in
            maker.left.equalTo(titleLabel.snp.right).offset(8)
            maker.top.equalTo(titleLabel.snp.top)
            maker.bottom.equalToSuperview().inset(16)
            maker.right.equalToSuperview().inset(16)
            maker.width.lessThanOrEqualTo(80)
        }
        
        forksCountLabel.snp.makeConstraints { maker in
            maker.top.equalTo(descriptionLabel.snp.bottom).offset(4)
            maker.bottom.equalTo(profileView.snp.bottom)
            maker.left.equalTo(titleLabel.snp.left)
        }
        
        starsCountLabel.snp.makeConstraints { maker in
            maker.top.equalTo(forksCountLabel.snp.top)
            maker.left.equalTo(forksCountLabel.snp.right).offset(8)
            maker.bottom.equalTo(profileView.snp.bottom)
            maker.right.equalTo(titleLabel.snp.right)
        }
        
        [starsCountLabel, forksCountLabel, descriptionLabel].forEach {
            $0.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
        }
        
        profileView.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
    }
}
