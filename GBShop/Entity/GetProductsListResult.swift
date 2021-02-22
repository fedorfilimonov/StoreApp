//
//  GetProductsListResult.swift
//  StoreApp
//
//  Created by Федор Филимонов on 19.02.2021.
//

import Foundation

// MARK: - GetProductsListResultElement
struct GetProductsListResultElement: Codable {
    let idProduct: Int
    let productName: String
    let price: Int

    enum CodingKeys: String, CodingKey {
        case idProduct = "id_product"
        case productName = "product_name"
        case price
    }
}

typealias GetProductsListResult = [GetProductsListResultElement]
