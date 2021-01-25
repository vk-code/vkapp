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
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
