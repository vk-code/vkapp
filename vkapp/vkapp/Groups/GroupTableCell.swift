//
//  GroupTableCell.swift
//  vkapp
//
//  Created by Vasiliy Kapyshkov on 25.01.2021.
//

import UIKit

class GroupTableCell: UITableViewCell {
    
    @IBOutlet var name: UILabel?
    @IBOutlet var picture: UIImageView?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        picture?.layer.cornerRadius = 25
        picture?.clipsToBounds = true
        picture?.isUserInteractionEnabled = true
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(animateAvatar(_:)))
        picture?.addGestureRecognizer(recognizer)
    }

    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
    @objc func animateAvatar(_ sender: Any) {
        guard let pictureView = self.picture else { return }
        
        UIView.animate(withDuration: 0.2) {
            pictureView.transform = CGAffineTransform(scaleX: 0.5, y: 1)
        } completion: { _ in
            UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 0.3, initialSpringVelocity: 0.6, options: [], animations: {
                pictureView.transform = CGAffineTransform(scaleX: 1, y: 1)
            })
        }
    }
}
