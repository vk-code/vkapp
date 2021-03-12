//
//  UserCell.swift
//  vkapp
//
//  Created by Vasiliy Kapyshkov on 24.01.2021.
//

import UIKit

class UserCell: UICollectionViewCell {
    
    @IBOutlet var photo: UIImageView?
    @IBOutlet var likeControl: LikeControl?
    
    func configure(likes: Int) {
        likeControl?.likesCount = likes
        likeControl?.likeBtn.imageView?.tintColor = .gray
        likeControl?.likeBtn.setTitle(String(likes), for: .normal)
        likeControl?.likeBtn.isSelected = false
        likeControl?.likeBtn.setImage(UIImage(systemName: "heart"), for: .normal)
    }
}
