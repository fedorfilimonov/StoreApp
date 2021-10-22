//
//  GetReviewsRequestFactory.swift
//  StoreApp
//
//  Created by Федор Филимонов on 05.03.2021.
//

import Foundation
import Alamofire

protocol GetReviewsRequestFactory {
    func getReviews(pageNumber: Int, idProduct: Int, completionHandler: @escaping (AFDataResponse<GetReviewsResult>) -> Void)
}
