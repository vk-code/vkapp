//
//  Group.swift
//  vkapp
//
//  Created by Vasiliy Kapyshkov on 24.01.2021.
//

import UIKit

struct Group: Equatable {
    
    let name: String
    let image: UIImage?
    
    init(name: String, image: String) {
        self.name = name
        
        if let newImage = UIImage(named: image) {
            self.image = newImage
        } else {
            self.image = UIImage(named: "nophoto")
        }
    }
}
