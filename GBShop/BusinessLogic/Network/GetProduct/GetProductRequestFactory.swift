//
//  GetProductRequestFactory.swift
//  StoreApp
//
//  Created by Федор Филимонов on 19.02.2021.
//

import Foundation
import Alamofire

protocol GetProductRequestFactory {
    func getProduct(idProduct: Int, completionHandler: @escaping (AFDataResponse<GetProductResult>) -> Void)
}

