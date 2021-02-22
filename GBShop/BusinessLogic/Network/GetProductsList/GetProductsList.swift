//
//  GetProductsList.swift
//  StoreApp
//
//  Created by Федор Филимонов on 19.02.2021.
//

import Foundation
import Alamofire

class GetProductsList: AbstractRequestFactory {
    let errorParser: AbstractErrorParser
    let sessionManager: Session
    let queue: DispatchQueue
    let baseUrl = URL(string: "https://raw.githubusercontent.com/GeekBrainsTutorial/online-store-api/master/responses/")!
    
    init(
        errorParser: AbstractErrorParser,
        sessionManager: Session,
        queue: DispatchQueue = DispatchQueue.global(qos: .utility)) {
        self.errorParser = errorParser
        self.sessionManager = sessionManager
        self.queue = queue
    }
}

extension GetProductsList: GetProductsListRequestFactory {
    func getProductsList(pageNumber: Int, idCategory: Int, completionHandler: @escaping (AFDataResponse<GetProductsListResult>) -> Void) {
        let requestModel = ProductsList(baseUrl: baseUrl, pageNumber: pageNumber, idCategory: idCategory)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension GetProductsList {
    struct ProductsList: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = "catalogData.json"
        
        let pageNumber: Int
        let idCategory: Int
        
        var parameters: Parameters? {
            return [
                
                "page_number" : pageNumber,
                "id_category" : idCategory
            ]
        }
    }
}

