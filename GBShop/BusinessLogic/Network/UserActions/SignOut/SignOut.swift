//
//  SignOut.swift
//  StoreApp
//
//  Created by Федор Филимонов on 18.02.2021.
//

import Foundation
import Alamofire

class SignOut: AbstractRequestFactory {
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

extension SignOut: SignOutRequestFactory {
    func signOut(idUser: Int, completionHandler: @escaping (AFDataResponse<SignOutResult>) -> Void) {
        let requestModel = SignOut(baseUrl: baseUrl, idUser: idUser)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension SignOut {
    struct SignOut: RequestRouter {
        let baseUrl: URL
//        let method: HTTPMethod = .get
//        let path: String = "logout.json"
        let method: HTTPMethod = .post
        let path: String = "signOut"
        
        let idUser: Int
        var parameters: Parameters? {
            return ["id_user" : idUser]
        }
    }
}
