//
//  SignUp.swift
//  StoreApp
//
//  Created by Федор Филимонов on 18.02.2021.
//

import Foundation
import Alamofire

class SignUp: AbstractRequestFactory {
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

extension SignUp: SignUpRequestFactory {
    func signUp(idUser: Int, userName: String, password: String, email: String, gender: String, creditCard: String, bio: String, completionHandler: @escaping (AFDataResponse<SignUpResult>) -> Void) {
        let requestModel = SignUp(baseUrl: baseUrl, idUser: idUser, userName: userName, password: password, email: email, gender: gender, creditCard: creditCard, bio: bio)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension SignUp {
    struct SignUp: RequestRouter {
        let baseUrl: URL
//        let method: HTTPMethod = .get
//        let path: String = "registerUser.json"
        let method: HTTPMethod = .post
        let path: String = "signUp"
        
        let idUser: Int
        let userName: String
        let password: String
        let email: String
        let gender: String
        let creditCard: String
        let bio: String
        
        var parameters: Parameters? {
            return [
                
                "id_user" : idUser,
                "username" : userName,
                "password" : password,
                "email" : email,
                "gender": gender,
                "credit_card" : creditCard,
                "bio" : bio
            ]
        }
    }
}
