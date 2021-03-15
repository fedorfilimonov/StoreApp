//
//  MakePaymentInCart.swift
//  StoreApp
//
//  Created by Федор Филимонов on 15.03.2021.
//

import Foundation
import Alamofire

class MakePaymentInCart: AbstractRequestFactory {
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

extension MakePaymentInCart: MakePaymentInCartRequestFactory {
    func makePaymentInCart(userID: Int, payAmount: Int, completionHandler: @escaping (AFDataResponse<MakePaymentInCartResult>) -> Void) {
        let requestModel = MakePaymentInCartRequest(baseUrl: baseUrl, userID: userID, payAmount: payAmount)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension MakePaymentInCart {
    struct MakePaymentInCartRequest: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .post
        let path: String = "makePaymentInCart"

        let userID: Int
        let payAmount: Int

        var parameters: Parameters? {
            return [
                "user_id" : userID,
                "pay_amount" : payAmount
            ]
        }
    }
}
