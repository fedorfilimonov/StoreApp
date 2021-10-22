//
//  SignUpTests.swift
//  StoreAppTests
//
//  Created by Федор Филимонов on 19.02.2021.
//

import XCTest
import Alamofire
@testable import StoreApp

class SignUpTests: XCTestCase {
    
    func testSignUp() throws {
        
        // Given
        // Initiate test data and system under test
        let requestFactory = RequestFactory()
        let signUp = requestFactory.makeSignUpRequestFactory()
        
        // When
        // Call system under test
        let signedUp = expectation(description: "Signed up")
        
        signUp.signUp(idUser: 123, userName: "Somebody", password: "mypassword", email: "some@some.ru", gender: "m", creditCard: "9872389-2424-234224-234", bio: "This is good! I think I will switch to another language") { response in
            
            // Then
            // Verify then output is as expected
            switch response.result {
            case .success(let register):
                XCTAssertEqual(register.userMessage, "Регистрация прошла успешно!")
                signedUp.fulfill()
            case .failure(let error):
                print(error.localizedDescription)
                XCTFail(error.localizedDescription)
            }
        }
        
        waitForExpectations(timeout: 5)
    }
}
