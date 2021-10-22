//
//  DeleteFromCart.swift
//  StoreApp
//
//  Created by Федор Филимонов on 15.03.2021.
//

import Foundation
import Alamofire

class DeleteFromCart: AbstractRequestFactory {
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

extension DeleteFromCart: DeleteFromCartRequestFactory {
    func deleteFromCart(productID: Int, completionHandler: @escaping (AFDataResponse<DeleteFromCartResult>) -> Void) {
        let requestModel = DeleteFromCartRequest(baseUrl: baseUrl, productID: productID)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension DeleteFromCart {
    struct DeleteFromCartRequest: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .post
        let path: String = "deleteFromCart"
        
        let productID: Int
        
        var parameters: Parameters? {
            return [
                "product_id" : productID
            ]
        }
    }
}
