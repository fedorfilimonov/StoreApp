//
//  GetProductsListRequestFactory.swift
//  StoreApp
//
//  Created by Федор Филимонов on 19.02.2021.
//

import Foundation
import Alamofire

protocol GetProductsListRequestFactory {
    func getProductsList(pageNumber: Int, idCategory: Int, completionHandler: @escaping (AFDataResponse<GetProductsListResult>) -> Void)
}
