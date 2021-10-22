//
//  DeleteReview.swift
//  StoreApp
//
//  Created by Федор Филимонов on 05.03.2021.
//

import Foundation
import Alamofire

class DeleteReview: AbstractRequestFactory {
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

extension DeleteReview: DeleteReviewRequestFactory {
    func deleteReview(idComment: Int, completionHandler: @escaping (AFDataResponse<DeleteReviewResult>) -> Void) {
        let requestModel = DeleteReviewRequest(baseUrl: baseUrl, idComment: idComment)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension DeleteReview {
    struct DeleteReviewRequest: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = "removeReview.json"
        
        let idComment: Int
        
        var parameters: Parameters? {
            return [
                "id_comment" : idComment
            ]
        }
    }
}
