//
//  News.swift
//  vkapp
//
//  Created by Vasiliy Kapyshkov on 04.02.2021.
//

import UIKit


struct News {
    let headline: String
    let date: String
    let text: String
    let photo: UIImage?
    
    var views = 0
    var likes = 0
    var comments = 0
    
    init(headline: String, date: String, text: String, imageName: String) {
        self.headline = headline
        self.date = date
        self.text = text
        
        if let photo = UIImage(named: imageName) {
            self.photo = photo
        } else {
            self.photo = nil
        }
    }
}
