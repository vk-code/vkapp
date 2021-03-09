//
//  GroupsModel.swift
//  vkapp
//
//  Created by Vasiliy Kapyshkov on 09.03.2021.
//

import Foundation

struct GroupsModel: Codable {
    let response: GroupsModelResponse
}

struct GroupsModelResponse: Codable {
    let count: Int
    let items: [GroupsModelItems]
}

struct GroupsModelItems: Codable {
    let id: Int
    let name: String
    let photo: String
    
    enum CodingKeys: String, CodingKey {
        case id, name
        case photo = "photo_100"
    }
}
