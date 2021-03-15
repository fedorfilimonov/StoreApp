//
//  GetReviewsResult.swift
//  StoreApp
//
//  Created by Федор Филимонов on 05.03.2021.
//

import Foundation

struct GetReviewsResult: Codable {
    let pageNumber: Int
    let reviews: [Review]
    
    enum CodingKeys: String, CodingKey {
        case pageNumber = "page_number"
        case reviews = "reviews"
    }
}
