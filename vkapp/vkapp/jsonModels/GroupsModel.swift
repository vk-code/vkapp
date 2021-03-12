//
//  GroupsModel.swift
//  vkapp
//
//  Created by Vasiliy Kapyshkov on 09.03.2021.
//

import Foundation
import RealmSwift

class GroupsModel: Object, Codable {
    @objc dynamic var response: GroupsModelResponse?
}

class GroupsModelResponse: Object, Codable {
    @objc dynamic var count: Int = 0
    var items = RealmSwift.List<GroupsModelItems>()
}

class GroupsModelItems: Object, Codable {
    @objc dynamic var id: Int = 0
    @objc dynamic var name: String = ""
    @objc dynamic var photo: String = ""
    
    enum CodingKeys: String, CodingKey {
        case id, name
        case photo = "photo_100"
    }
}
