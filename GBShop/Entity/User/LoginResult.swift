//
//  LoginResult.swift
//  StoreApp
//
//  Created by Федор Филимонов on 13.02.2021.
//

import Foundation

struct LoginResult: Codable {
    var result: Int
    var user: User
}

struct User: Codable {
    var id: Int
    var login: String
    var name: String
    var lastname: String
    
//    enum CodingKeys: String, CodingKey {
//        case id = "id_user"
//        case login = "user_login"
//        case name = "user_name"
//        case lastname = "user_lastname"
//    }
}
