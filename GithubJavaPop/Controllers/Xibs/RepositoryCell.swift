
import UIKit

class RepositoryCell: UITableViewCell {
  
  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var descriptionLabel: UILabel!
  @IBOutlet weak var forksLabel: UILabel!
  @IBOutlet weak var favoritesLabel: UILabel!
  @IBOutlet weak var ownerAvatarImageView: UIImageView!
  @IBOutlet weak var ownerNameLabel: UILabel!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    self.customizeView()
  }
  
  fileprivate func customizeView() {
    
    self.nameLabel.textColor = StyleGuide.Color.Blue.value
    self.nameLabel.font = StyleGuide.Font.Title.value
    
    self.descriptionLabel.textColor = StyleGuide.Color.Black.value
    self.descriptionLabel.font = StyleGuide.Font.Description.value
    
    self.forksLabel.textColor = StyleGuide.Color.Orange.value
    self.forksLabel.font = StyleGuide.Font.Number.value
    
    self.favoritesLabel.textColor = StyleGuide.Color.Orange.value
    self.favoritesLabel.font = StyleGuide.Font.Number.value
    
    self.ownerNameLabel.textColor = StyleGuide.Color.Blue.value
    self.ownerNameLabel.font = StyleGuide.Font.Name.value
    
    self.ownerAvatarImageView.layer.cornerRadius = self.ownerAvatarImageView.bounds.width / 2
    self.ownerAvatarImageView.clipsToBounds = true
    
  }
  
}
