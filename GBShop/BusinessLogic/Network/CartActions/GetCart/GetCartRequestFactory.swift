//
//  GetCartRequestFactory.swift
//  StoreApp
//
//  Created by Федор Филимонов on 15.03.2021.
//

import Foundation
import Alamofire

protocol GetCartRequestFactory {
    func getCart(userID: Int, completionHandler: @escaping (AFDataResponse<GetCartResult>) -> Void)
}
