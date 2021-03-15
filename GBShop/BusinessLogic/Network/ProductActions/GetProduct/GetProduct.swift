//
//  GetProduct.swift
//  StoreApp
//
//  Created by Федор Филимонов on 19.02.2021.
//

import Foundation
import Alamofire

class GetProduct: AbstractRequestFactory {
    let errorParser: AbstractErrorParser
    let sessionManager: Session
    let queue: DispatchQueue
    let baseUrl = URL(string: "https://raw.githubusercontent.com/GeekBrainsTutorial/online-store-api/master/responses/")!
    
    init(
        errorParser: AbstractErrorParser,
        sessionManager: Session,
        queue: DispatchQueue = DispatchQueue.global(qos: .utility)) {
        self.errorParser = errorParser
        self.sessionManager = sessionManager
        self.queue = queue
    }
}

extension GetProduct: GetProductRequestFactory {
    func getProduct(idProduct: Int, completionHandler: @escaping (AFDataResponse<GetProductResult>) -> Void) {
        let requestModel = Product(baseUrl: baseUrl, idProduct: idProduct)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension GetProduct {
    struct Product: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = "getGoodById.json"
        
        let idProduct: Int

        var parameters: Parameters? {
            return [
                
                "id_product": idProduct
            ]
        }
    }
}
