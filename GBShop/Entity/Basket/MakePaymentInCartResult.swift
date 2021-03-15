//
//  MakePaymentInCartResult.swift
//  StoreApp
//
//  Created by Федор Филимонов on 15.03.2021.
//

struct MakePaymentInCartResult: Codable {
    let result: Int
    
    enum CodingKeys: String, CodingKey {
        case result = "result"
    }
}
