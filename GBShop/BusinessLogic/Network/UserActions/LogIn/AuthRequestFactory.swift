//
//  AuthRequestFactory.swift
//  StoreApp
//
//  Created by Федор Филимонов on 13.02.2021.
//

import Foundation
import Alamofire

protocol AuthRequestFactory {
    func login(userName: String, password: String, completionHandler: @escaping (AFDataResponse<LoginResult>) -> Void)
}
