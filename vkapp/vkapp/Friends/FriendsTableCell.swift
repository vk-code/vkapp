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
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
