//
//  FriendsCell.swift
//  vkapp
//
//  Created by Vasiliy Kapyshkov on 24.01.2021.
//

import UIKit

class FriendsTableCell: UITableViewCell {

    @IBOutlet var name: UILabel?
    @IBOutlet var avatar: AvatarView?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(animateAvatar(_:)))
        avatar?.addGestureRecognizer(recognizer)
    }

    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
    @objc func animateAvatar(_ sender: AvatarView) {
        guard let avatarView = self.avatar else { return }
        
        UIView.animate(withDuration: 0.2) {
            avatarView.transform = CGAffineTransform(scaleX: 0.5, y: 1)
        } completion: { _ in
            UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 0.3, initialSpringVelocity: 0.6, options: [], animations: {
                avatarView.transform = CGAffineTransform(scaleX: 1, y: 1)
            })
        }
    }
}
