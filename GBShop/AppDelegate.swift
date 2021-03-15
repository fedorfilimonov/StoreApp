//
//  AppDelegate.swift
//  StoreApp
//
//  Created by Федор Филимонов on 10.02.2021.
//

import UIKit
import Alamofire

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    let requestFactory = RequestFactory()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // Profile actions
        signUp()
        signIn()
//        updateProfile() // Нужно дописать реализацию на сервере
        signOut()
        
        // Product actions
        // Нужно дописать реализацию на сервере
//        getProductsList()
//        getProduct()
        
        // Review actions
        // Нужно дописать реализацию на сервере
//        addReview()
//        getReview()
//        deleteReview()
        
        // Cart actions
        addToCart()
        deleteFromCart()
        getCart()
        makePaymentInCart()

        return true
    }
    
    // MARK: - Profile actions
    
    func signUp() {
        let signUp = requestFactory.makeSignUpRequestFactory()
        signUp.signUp(idUser: 123, userName: "Somebody", password: "mypassword", email: "some@some.ru", gender: "m", creditCard: "9872389-2424-234224-234", bio: "This is good! I think I will switch to another language") { response in
            switch response.result {
            case .success(let register):
                print(register)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func signIn() {
        let auth = requestFactory.makeAuthRequestFatory()
        auth.login(userName: "Somebody", password: "mypassword") { response in
            switch response.result {
            case .success(let login):
                print(login)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func updateProfile() {
        let updateProfile = requestFactory.makeUpdateProfileRequestFactory()
        updateProfile.updateProfile(idUser: 123, userName: "Somebody", password: "mypassword", email: "some@some.ru", gender: "m", creditCard: "9872389-2424-234224-234", bio: "This is good! I think I will switch to another language") { response in
            switch response.result {
            case .success(let updateProfile):
                print(updateProfile)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func signOut() {
        let signOut = requestFactory.makeSignOutRequestFactory()
        signOut.signOut(idUser: 123) { response in
            switch response.result {
            case .success(let signOut):
                print(signOut)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    // MARK: - Product actions
    
    func getProductsList() {
        let getProductsList = requestFactory.makeGetProductsListRequestFactory()
        getProductsList.getProductsList(pageNumber: 1, idCategory: 1) { response in
            switch response.result {
            case .success(let getProductsList):
                print(getProductsList)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func getProduct() {
        let getProduct = requestFactory.makeGetProductRequestFactory()
        getProduct.getProduct(idProduct: 123) { response in
            switch response.result {
            case .success(let getProduct):
                print(getProduct)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    // MARK: - Review actions
    
    func addReview() {
        let addReview = requestFactory.makeAddReviewRequestFactory()
        addReview.addReview(idUser: 123, text: "Review text") { response in
            switch response.result {
            case .success(let addReview):
                print(addReview)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func getReview() {
        let getReviews = requestFactory.makeGetReviewsRequestFactory()
        getReviews.getReviews(pageNumber: 1, idProduct: 123) { response in
            switch response.result {
            case .success(let getReviews):
                print(getReviews)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func deleteReview() {
        let deleteReview = requestFactory.makeDeleteReviewRequestFactory()
        deleteReview.deleteReview(idComment: 123) { response in
            switch response.result {
            case .success(let deleteReview):
                print(deleteReview)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    // MARK: - Cart actions
    
    func addToCart() {
        let addToCart = requestFactory.makeAddToCartRequestFactory()
        addToCart.addToCart(productID: 123, quantityInCart: 1) { response in
            switch response.result {
            case .success(let addProductToCart):
                print(addProductToCart)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func deleteFromCart() {
        let deleteFromCart = requestFactory.makeDeleteFromCartRequestFactory()
        deleteFromCart.deleteFromCart(productID: 123) { response in
            switch response.result {
            case .success(let deleteProductFromCart):
                print(deleteProductFromCart)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func getCart() {
        let getCart = requestFactory.makeGetCartRequestFactory()
        getCart.getCart(userID: 123) { response in
            switch response.result {
            case .success(let getCart):
                print(getCart)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func makePaymentInCart() {
        let makePayment = requestFactory.makePaymentInCartRequestFactory()
        makePayment.makePaymentInCart(userID: 123, payAmount: 1000) { response in
            switch response.result {
            case .success(let makePayment):
                print(makePayment)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    // MARK: UISceneSession Lifecycle
    
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    
    
}

