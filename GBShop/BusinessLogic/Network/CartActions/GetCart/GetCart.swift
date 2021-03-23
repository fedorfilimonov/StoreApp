//
//  GetCart.swift
//  StoreApp
//
//  Created by Федор Филимонов on 15.03.2021.
//

import Foundation
import Alamofire

class GetCart: AbstractRequestFactory {
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

extension GetCart: GetCartRequestFactory {
    func getCart(userID: Int, completionHandler: @escaping (AFDataResponse<GetCartResult>) -> Void) {
        let requestModel = GetCartRequest(baseUrl: baseUrl, userID: userID)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension GetCart {
    struct GetCartRequest: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .post
        let path: String = "getCart"

        let userID: Int

        var parameters: Parameters? {
            return [
                "user_id" : userID
            ]
        }
    }
}
