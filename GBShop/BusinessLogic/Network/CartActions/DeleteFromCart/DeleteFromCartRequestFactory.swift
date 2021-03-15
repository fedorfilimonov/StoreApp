//
//  DeleteFromCartRequestFactory.swift
//  StoreApp
//
//  Created by Федор Филимонов on 15.03.2021.
//

import Foundation
import Alamofire

protocol DeleteFromCartRequestFactory {
    func deleteFromCart(productID: Int, completionHandler: @escaping (AFDataResponse<DeleteFromCartResult>) -> Void)
}
