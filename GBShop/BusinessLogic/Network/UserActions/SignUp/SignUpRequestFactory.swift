//
//  SignUpRequestFactory.swift
//  StoreApp
//
//  Created by Федор Филимонов on 18.02.2021.
//

import Foundation
import Alamofire

protocol SignUpRequestFactory {
    func signUp(idUser: Int, userName: String, password: String, email: String, gender: String, creditCard: String, bio: String, completionHandler: @escaping (AFDataResponse<SignUpResult>) -> Void)
}
