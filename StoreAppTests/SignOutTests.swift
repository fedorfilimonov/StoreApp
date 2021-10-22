//
//  SignOutTests.swift
//  StoreAppTests
//
//  Created by Федор Филимонов on 19.02.2021.
//

import XCTest
import Alamofire
@testable import StoreApp

class SignOutTests: XCTestCase {
    
    func testSignOut() throws {
        
        // Given
        // Initiate test data and system under test
        let requestFactory = RequestFactory()
        let signOut = requestFactory.makeSignOutRequestFactory()
        
        // When
        // Call system under test
        let signedOut = expectation(description: "Signed out")
        
        signOut.signOut(idUser: 123) { response in
            
            // Then
            // Verify then output is as expected
            switch response.result {
            case .success(let signOut):
                XCTAssertEqual(signOut.result, 1)
                signedOut.fulfill()
            case .failure(let error):
                print(error.localizedDescription)
                XCTFail(error.localizedDescription)
            }
        }
        
        waitForExpectations(timeout: 5)
    }
}
