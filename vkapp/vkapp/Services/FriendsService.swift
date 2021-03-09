//
//  FriendsService.swift
//  vkapp
//
//  Created by Vasiliy Kapyshkov on 09.03.2021.
//

import Foundation
import Alamofire

protocol FriendsServiceProtocol {
    typealias ServiceCompletion = (_ data: FriendsModel?, _ error: Error?) -> ()
}

class FriendsService: FriendsServiceProtocol {
    
    static func getFriends(completion: @escaping ServiceCompletion) {
        let requestParams: Parameters = [
            "user_id": Session.shared.userId,
            "fields": "photo_100",
            "order": "name"
        ]
        
        VKRequestManager<FriendsModel>.request(method: .friendsGet, additionalParams: requestParams) { (result, error) in
            if let error = error {
                completion(nil, error)
            }
            
            if let data = result {
                completion(data, nil)
            }
        }
    }
}
