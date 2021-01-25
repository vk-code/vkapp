//
//  FriendsCell.swift
//  vkapp
//
//  Created by Vasiliy Kapyshkov on 24.01.2021.
//

import UIKit

class FriendsTableCell: UITableViewCell {

    @IBOutlet var photo: UIImageView?
    @IBOutlet var name: UILabel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        photo?.layer.cornerRadius = 25
        photo?.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
