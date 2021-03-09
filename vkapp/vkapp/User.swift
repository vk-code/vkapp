//
//  User.swift
//  vkapp
//
//  Created by Vasiliy Kapyshkov on 24.01.2021.
//

import UIKit

struct User {
    
    let id: Int
    let name: String
    let photo: UIImage?
    var firstNameLetter: String {
        return String(name.prefix(1))
    }
    var presentedInTable = false
    
    init(id: Int, name: String, photoUrl: String) {
        self.id = id
        self.name = name
        
        let url = URL(string: photoUrl)
        let data = try? Data(contentsOf: url!)
        
        if let data = data, let newPhoto = UIImage(data: data) {
            self.photo = newPhoto
        } else {
            self.photo = UIImage(named: "nophoto")
        }
    }
}
