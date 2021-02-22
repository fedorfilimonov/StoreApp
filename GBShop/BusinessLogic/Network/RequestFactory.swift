//
//  RequestFactory.swift
//  StoreApp
//
//  Created by Федор Филимонов on 13.02.2021.
//

import Foundation
import Alamofire

class RequestFactory {
    
    let baseUrl = URL(string: "https://raw.githubusercontent.com/GeekBrainsTutorial/online-store-api/master/responses/")!
    
    func makeErrorParser() -> AbstractErrorParser {
        return ErrorParser()
    }
    
    lazy var commonSession: Session = {
        let configuration = URLSessionConfiguration.default
        configuration.httpShouldSetCookies = false
        configuration.headers = .default
        let manager = Session(configuration: configuration)
        return manager
    }()
    
    let sessionQueue = DispatchQueue.global(qos: .utility)
    
    func makeSignUpRequestFactory() -> SignUpRequestFactory {
        let errorParser = makeErrorParser()
        return SignUp(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }
    
    func makeAuthRequestFatory() -> AuthRequestFactory {
        let errorParser = makeErrorParser()
        return Auth(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }
    
    func makeUpdateProfileRequestFactory() -> UpdateProfileRequestFactory {
        let errorParser = makeErrorParser()
        return UpdateProfile(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }
    
    func makeSignOutRequestFactory() -> SignOutRequestFactory {
        let errorParser = makeErrorParser()
        return SignOut(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }
    
    func makeGetProductsListRequestFactory() -> GetProductsListRequestFactory {
        let errorParser = makeErrorParser()
        return GetProductsList(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }
    
    func makeGetProductRequestFactory() -> GetProductRequestFactory {
        let errorParser = makeErrorParser()
        return GetProduct(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }
}
