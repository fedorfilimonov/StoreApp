//
//  AddToCartRequestFactory.swift
//  StoreApp
//
//  Created by Федор Филимонов on 15.03.2021.
//

import Foundation
import Alamofire

protocol AddToCartRequestFactory {
    func addToCart(productID: Int, quantityInCart: Int, completionHandler: @escaping (AFDataResponse<AddToCartResult>) -> Void)
}
