
import UIKit

class PullRequestCell: UITableViewCell {
  
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var bodyLabel: UILabel!
  @IBOutlet weak var dateLabel: UILabel!
  @IBOutlet weak var ownerAvatarImageView: UIImageView!
  @IBOutlet weak var ownerNameLabel: UILabel!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    self.customizeView()
  }
  
  fileprivate func customizeView() {
    
    self.titleLabel.textColor = StyleGuide.Color.Blue.value
    self.titleLabel.font = StyleGuide.Font.Title.value
    
    self.bodyLabel.textColor = StyleGuide.Color.Black.value
    self.bodyLabel.font = StyleGuide.Font.Description.value
    
    self.dateLabel.textColor = StyleGuide.Color.Gray.value
    self.dateLabel.font = StyleGuide.Font.Date.value
    
    self.ownerNameLabel.textColor = StyleGuide.Color.Blue.value
    self.ownerNameLabel.font = StyleGuide.Font.Name.value
    
    self.ownerAvatarImageView.layer.cornerRadius = self.ownerAvatarImageView.bounds.width / 2
    self.ownerAvatarImageView.clipsToBounds = true
    
  }
  
}
