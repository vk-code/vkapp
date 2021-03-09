//
//  VKRequest.swift
//  vkapp
//
//  Created by Vasiliy Kapyshkov on 08.03.2021.
//

import Foundation
import Alamofire

protocol VKRequestManagerProtocol {
    typealias RequestCompletion = (_ data: T?, _ error: Error?) -> ()
    associatedtype T
}

class VKRequestManager<T: Decodable>: VKRequestManagerProtocol {
    
    static func request(method: VKMethods, additionalParams: Parameters?, completion: @escaping RequestCompletion) {
        
        var apiParams: Parameters = [
            "access_token": Session.shared.token,
            "v": Session.shared.apiVersion,
        ]
        
        if let additionalParams = additionalParams {
            apiParams = apiParams.merging(additionalParams) { current, _ in current }
        }
        
        AF.request("https://api.vk.com/method/\(method.rawValue)", method: .get, parameters: apiParams).responseData { response in
            switch response.result {
            case let .success(data):
                do {
                    let model = try JSONDecoder().decode(T.self, from: data)
                    completion(model, nil)
                } catch {
                    completion(nil, error)
                }
                
            case let .failure(error):
                completion(nil, error)
            }
        }
    }
}
