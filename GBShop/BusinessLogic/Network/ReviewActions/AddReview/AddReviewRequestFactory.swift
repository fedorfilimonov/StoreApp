//
//  AddReviewRequestFactory.swift
//  StoreApp
//
//  Created by Федор Филимонов on 05.03.2021.
//

import Foundation
import Alamofire

protocol AddReviewRequestFactory {
    func addReview(idUser: Int, text: String, completionHandler: @escaping (AFDataResponse<AddReviewResult>) -> Void)
}
