//
//  UserModel.swift
//  vkapp
//
//  Created by Vasiliy Kapyshkov on 09.03.2021.
//

import Foundation

struct UserModel: Codable {
    let response: UserModelResponse
}

struct UserModelResponse: Codable {
    let count: Int
    let items: [UserPhotosModel]
}

struct UserPhotosModel: Codable {
    let id: Int
    let sizes: [UserSinglePhotoModel]
}

struct UserSinglePhotoModel: Codable {
    let url: String
}
