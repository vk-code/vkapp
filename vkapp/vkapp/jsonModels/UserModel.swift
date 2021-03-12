//
//  UserModel.swift
//  vkapp
//
//  Created by Vasiliy Kapyshkov on 09.03.2021.
//

import Foundation
import RealmSwift

class UserModel: Object, Codable {
    var response: UserModelResponse?
}

class UserModelResponse: Object, Codable {
    @objc dynamic var count: Int = 0
    var items = RealmSwift.List<UserPhotosModel>()
}

class UserPhotosModel: Object, Codable {
    @objc dynamic var id: Int = 0
    var sizes = RealmSwift.List<UserSinglePhotoModel>()
}

class UserSinglePhotoModel: Object, Codable {
    @objc dynamic var url: String = ""
}
