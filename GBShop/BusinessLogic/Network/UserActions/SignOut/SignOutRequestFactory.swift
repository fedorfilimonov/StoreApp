//
//  SignOutRequestFactory.swift
//  StoreApp
//
//  Created by Федор Филимонов on 18.02.2021.
//

import Foundation
import Alamofire

protocol SignOutRequestFactory {
    func signOut(idUser: Int, completionHandler: @escaping (AFDataResponse<SignOutResult>) -> Void)
}
