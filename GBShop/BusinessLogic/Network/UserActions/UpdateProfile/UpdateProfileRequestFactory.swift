//
//  UpdateProfileRequestFactory.swift
//  StoreApp
//
//  Created by Федор Филимонов on 18.02.2021.
//

import Foundation
import Alamofire

protocol UpdateProfileRequestFactory {
    func updateProfile(idUser: Int, userName: String, password: String, email: String, gender: String, creditCard: String, bio: String, completionHandler: @escaping (AFDataResponse<UpdateProfileResult>) -> Void)
}
