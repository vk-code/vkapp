//
//  NewsTableCell.swift
//  vkapp
//
//  Created by Vasiliy Kapyshkov on 04.02.2021.
//

import UIKit

class NewsTableCell: UITableViewCell {

    @IBOutlet var authorImageView: UIImageView?
    @IBOutlet var newsHeadlineLabel: UILabel?
    @IBOutlet var dateHeadlineLabel: UILabel?
    @IBOutlet var newsTextLabel: UILabel?
    @IBOutlet var newsPhotoView: UIImageView?
    @IBOutlet var likeControl: LikeControl?
    @IBOutlet var commentBtn: UIButton?
    @IBOutlet var shareBtn: UIButton?
    @IBOutlet var totalViewsLabel: UILabel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        newsTextLabel?.numberOfLines = 0
        newsTextLabel?.lineBreakMode = .byWordWrapping
        newsTextLabel?.sizeToFit()
        
        if let authorImage = authorImageView {
            authorImage.clipsToBounds = true
            authorImage.layer.cornerRadius = authorImage.frame.width / 2
            authorImage.contentMode = .scaleAspectFill
        }
        
        if let newsPhoto = newsPhotoView {
            newsPhoto.contentMode = .scaleAspectFill
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
