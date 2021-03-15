//
//  RequestFactory.swift
//  StoreApp
//
//  Created by Федор Филимонов on 13.02.2021.
//

import Foundation
import Alamofire

class RequestFactory {
    
//    let baseUrl = URL(string: "http://127.0.0.1:8080/")!
    
    let baseUrl = URL(string: "https://arcane-waters-29586.herokuapp.com/")!

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
        return SignUp(baseUrl: baseUrl, errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }
    
    func makeAuthRequestFatory() -> AuthRequestFactory {
        let errorParser = makeErrorParser()
        return Auth(baseUrl: baseUrl, errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }
    
    func makeUpdateProfileRequestFactory() -> UpdateProfileRequestFactory {
        let errorParser = makeErrorParser()
        return UpdateProfile(baseUrl: baseUrl, errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }
    
    func makeSignOutRequestFactory() -> SignOutRequestFactory {
        let errorParser = makeErrorParser()
        return SignOut(baseUrl: baseUrl, errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }
    
    func makeGetProductsListRequestFactory() -> GetProductsListRequestFactory {
        let errorParser = makeErrorParser()
        return GetProductsList(baseUrl: baseUrl, errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }
    
    func makeGetProductRequestFactory() -> GetProductRequestFactory {
        let errorParser = makeErrorParser()
        return GetProduct(baseUrl: baseUrl, errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }
    
    func makeAddReviewRequestFactory() -> AddReviewRequestFactory {
        let errorParser = makeErrorParser()
        return AddReview(baseUrl: baseUrl, errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }
    
    func makeGetReviewsRequestFactory() -> GetReviewsRequestFactory {
        let errorParser = makeErrorParser()
        return GetReviews(baseUrl: baseUrl, errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }
    
    func makeDeleteReviewRequestFactory() -> DeleteReviewRequestFactory {
        let errorParser = makeErrorParser()
        return DeleteReview(baseUrl: baseUrl, errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }
    
    func makeAddToCartRequestFactory() -> AddToCartRequestFactory {
        let errorParser = makeErrorParser()
        return AddToCart(baseUrl: baseUrl, errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }
    
    func makeDeleteFromCartRequestFactory() -> DeleteFromCartRequestFactory {
        let errorParser = makeErrorParser()
        return DeleteFromCart(baseUrl: baseUrl, errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }
    
    func makeGetCartRequestFactory() -> GetCartRequestFactory {
        let errorParser = makeErrorParser()
        return GetCart(baseUrl: baseUrl, errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }
    
    func makePaymentInCartRequestFactory() -> MakePaymentInCartRequestFactory {
        let errorParser = makeErrorParser()
        return MakePaymentInCart(baseUrl: baseUrl, errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }
}
