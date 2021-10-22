//
//  AuthTests.swift
//  StoreAppTests
//
//  Created by Федор Филимонов on 19.02.2021.
//

import XCTest
import Alamofire
@testable import StoreApp

class AuthTests: XCTestCase {
    
    func testSignIn() throws {
        
        // Given
        // Initiate test data and system under test
        let requestFactory = RequestFactory()
        let auth = requestFactory.makeAuthRequestFatory()
        
        // When
        // Call system under test
        let signedIn = expectation(description: "Logged in")
        
        auth.login(userName: "Somebody", password: "mypassword") { response in
            
            // Then
            // Verify then output is as expected
            switch response.result {
            case .success(let login):
                XCTAssertEqual(login.user.id, 123)
                signedIn.fulfill()
            case .failure(let error):
                print(error.localizedDescription)
                XCTFail(error.localizedDescription)
            }
        }
        
        waitForExpectations(timeout: 5)
    }
}
