//
//  UserService.swift
//  vkapp
//
//  Created by Vasiliy Kapyshkov on 09.03.2021.
//

import Foundation
import Alamofire

protocol UserServiceProtocol {
    typealias ServiceCompletion = (_ data: UserModel?, _ error: Error?) -> ()
}

class UserService: UserServiceProtocol {

    static func getAllPhotos(userID: Int, completion: @escaping ServiceCompletion) {
        let requestParams: Parameters = [
            "owner_id": userID,
            "photo_sizes": true,
            "extended": true
        ]

        VKRequestManager<UserModel>.request(method: .photosGet, additionalParams: requestParams) { (result, error) in
            if let error = error {
                completion(nil, error)
            }

            if let data = result {
                completion(data, nil)
            }
        }
    }
}
