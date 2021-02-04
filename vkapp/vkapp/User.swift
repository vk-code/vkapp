//
//  User.swift
//  vkapp
//
//  Created by Vasiliy Kapyshkov on 24.01.2021.
//

import UIKit

struct User {
    
    let name: String
    let photo: UIImage?
    var firstNameLetter: String {
        return String(name.prefix(1))
    }
    var presentedInTable = false
    
    init(name: String) {
        self.name = name
        
        if let newPhoto = UIImage(named: name) {
            self.photo = newPhoto
        } else {
            self.photo = UIImage(named: "nophoto")
        }
    }
}
