//
//  AddReviewResult.swift
//  StoreApp
//
//  Created by Федор Филимонов on 05.03.2021.
//

import Foundation

struct AddReviewResult: Codable {
    let result: Int
    let userMessage: String
    
    enum CodingKeys: String, CodingKey {
        case result = "result"
        case userMessage = "userMessage"
    }
}
