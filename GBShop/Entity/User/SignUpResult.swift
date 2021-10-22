//
//  SignUpResult.swift
//  StoreApp
//
//  Created by Федор Филимонов on 18.02.2021.
//

import Foundation

struct SignUpResult: Codable {
    let result: Int
    let userMessage: String
    
    enum CodingKeys: String, CodingKey {
        case result = "result"
        case userMessage = "user_message"
    }
}

