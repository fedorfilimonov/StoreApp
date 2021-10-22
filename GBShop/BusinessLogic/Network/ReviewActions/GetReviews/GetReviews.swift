//
//  GetReviews.swift
//  StoreApp
//
//  Created by Федор Филимонов on 05.03.2021.
//

import Foundation
import Alamofire

class GetReviews: AbstractRequestFactory {
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

extension GetReviews: GetReviewsRequestFactory {
    func getReviews(pageNumber: Int, idProduct: Int, completionHandler: @escaping (AFDataResponse<GetReviewsResult>) -> Void) {
        let requestModel = GetReviewsRequest(baseUrl: baseUrl, pageNumber: pageNumber, idProduct: idProduct)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension GetReviews {
    struct GetReviewsRequest: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = "getReviews.json"
        
        let pageNumber: Int
        let idProduct: Int
        
        var parameters: Parameters? {
            return [
                "page_number" : pageNumber,
                "id_product" : idProduct
            ]
        }
    }
}
