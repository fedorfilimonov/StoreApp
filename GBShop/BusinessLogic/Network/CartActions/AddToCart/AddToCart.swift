//
//  AddToCart.swift
//  StoreApp
//
//  Created by Федор Филимонов on 15.03.2021.
//

import Foundation
import Alamofire

class AddToCart: AbstractRequestFactory {
    let errorParser: AbstractErrorParser
    let sessionManager: Session
    let queue: DispatchQueue
    let baseUrl: URL
    
    init(baseUrl: URL, errorParser: AbstractErrorParser,
         sessionManager: Session,
         queue: DispatchQueue = DispatchQueue.global(qos: .utility)) {
        self.baseUrl = baseUrl
        self.errorParser = errorParser
        self.sessionManager = sessionManager
        self.queue = queue
    }
}

extension AddToCart: AddToCartRequestFactory {
    func addToCart(productID: Int, quantityInCart: Int, completionHandler: @escaping (AFDataResponse<AddToCartResult>) -> Void) {
        let requestModel = AddToCartRequest(baseUrl: baseUrl, productID: productID, quantityInCart: quantityInCart)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension AddToCart {
    struct AddToCartRequest: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .post
        let path: String = "addToCart"
        
        let productID: Int
        let quantityInCart: Int
        
        var parameters: Parameters? {
            return [
                "product_id" : productID,
                "quantity_in_cart" : quantityInCart,
            ]
        }
    }
}
