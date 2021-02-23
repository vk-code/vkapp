//
//  Session.swift
//  vkapp
//
//  Created by Vasiliy Kapyshkov on 23.02.2021.
//

import UIKit

class Session {
    
    static let shared = Session()
    var token: String = ""
    var userId: Int = 0
    
    private init() {}
}
