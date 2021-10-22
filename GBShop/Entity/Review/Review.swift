//
//  Review.swift
//  StoreApp
//
//  Created by Федор Филимонов on 05.03.2021.
//

import Foundation

struct Review: Codable {
    let idComment: Int
    let idUser: Int
    let text: String
    
    enum CodingKeys: String, CodingKey {
        case idComment = "id_comment"
        case idUser = "id_user"
        case text = "text"
    }
}
