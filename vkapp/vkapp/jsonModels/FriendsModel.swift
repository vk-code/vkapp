//
//  FriendsModel.swift
//  vkapp
//
//  Created by Vasiliy Kapyshkov on 08.03.2021.
//

import Foundation
import RealmSwift

class FriendsModel: Object, Codable {
    @objc dynamic var response: FriendsModelResponse?
}

class FriendsModelResponse: Object, Codable {
    @objc dynamic var count: Int = 0
    var items = RealmSwift.List<FriendsModelItems>()
}

class FriendsModelItems: Object, Codable {
    @objc dynamic var id: Int = 0
    @objc dynamic var firstName: String = ""
    @objc dynamic var lastName: String = ""
    @objc dynamic var photo: String = ""
    
    enum CodingKeys: String, CodingKey {
        case id
        case firstName = "first_name"
        case lastName = "last_name"
        case photo = "photo_100"
    }
}
