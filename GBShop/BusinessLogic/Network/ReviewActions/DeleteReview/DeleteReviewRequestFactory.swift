//
//  DeleteReviewRequestFactory.swift
//  StoreApp
//
//  Created by Федор Филимонов on 05.03.2021.
//

import Foundation
import Alamofire

protocol DeleteReviewRequestFactory {
    func deleteReview(idComment: Int, completionHandler: @escaping (AFDataResponse<DeleteReviewResult>) -> Void)
}
