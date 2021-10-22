//
//  MakePaymentInCartRequestFactory.swift
//  StoreApp
//
//  Created by Федор Филимонов on 15.03.2021.
//

import Foundation
import Alamofire

protocol MakePaymentInCartRequestFactory {
    func makePaymentInCart(userID: Int, payAmount: Int, completionHandler: @escaping (AFDataResponse<MakePaymentInCartResult>) -> Void)
}
