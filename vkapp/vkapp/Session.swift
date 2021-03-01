//
//  Session.swift
//  vkapp
//
//  Created by Vasiliy Kapyshkov on 02.03.2021.
//

import Foundation

import UIKit

class Session {
    
    static let shared = Session()
    var token: String = ""
    var userId: Int = 0
    
    private init() {}
}
