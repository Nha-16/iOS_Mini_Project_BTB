//
//  NewFeedTableViewCell.swift
//  iOS_Mini_Project_Panha_BTB
//
//  Created by BTB_001 on 29/11/21.
//

import UIKit
import Kingfisher

class NewFeedTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var img: UIImageView!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func config(articles: ArticleModel){
        self.titleLabel.text = articles.title
        self.descriptionLabel.text = articles.description
        self.dateLabel.text = articles.date
        self.authorLabel.text = articles.byAuthor
        let url = URL(string: articles.imageUrl)
        
        let defaultImage = UIImage(named: "Image.jpg")
        self.img.kf.setImage(with: url, placeholder: defaultImage, options: [.transition(.fade(0.25))], completionHandler: nil)
        }
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }

}
