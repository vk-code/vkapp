//
//  FriendsModel.swift
//  vkapp
//
//  Created by Vasiliy Kapyshkov on 08.03.2021.
//

import Foundation

struct FriendsModel: Codable {
    let response: FriendsModelResponse
}

struct FriendsModelResponse: Codable {
    let count: Int
    let items: [FriendsModelItems]
}

struct FriendsModelItems: Codable {
    let id: Int
    let firstName: String
    let lastName: String
    let photo: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case firstName = "first_name"
        case lastName = "last_name"
        case photo = "photo_100"
    }
}
