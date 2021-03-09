//
//  GroupsService.swift
//  vkapp
//
//  Created by Vasiliy Kapyshkov on 09.03.2021.
//

import Foundation
import Alamofire

protocol GroupsServiceProtocol {
    typealias ServiceCompletion = (_ data: GroupsModel?, _ error: Error?) -> ()
}

class GroupsService: GroupsServiceProtocol {
    
    static func getGroups(completion: @escaping ServiceCompletion) {
        
        let requestParams: Parameters = [
            "user_id": Session.shared.userId,
            "extended": true
        ]
        
        VKRequestManager<GroupsModel>.request(method: .groupsGet, additionalParams: requestParams) { (result, error) in
            if let error = error {
                completion(nil, error)
            }
            
            if let data = result {
                completion(data, nil)
            }
        }
    }
}
