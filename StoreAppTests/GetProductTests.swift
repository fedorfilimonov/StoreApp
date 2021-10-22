//
//  GetProductTests.swift
//  StoreAppTests
//
//  Created by Федор Филимонов on 22.02.2021.
//

import XCTest
import Alamofire
@testable import StoreApp

class GetProductTests: XCTestCase {
    
    func testGetProduct() throws {
        
        // Given
        // Initiate test data and system under test
        let requestFactory = RequestFactory()
        let getProduct = requestFactory.makeGetProductRequestFactory()
        
        // When
        // Call system under test
        let receivedProduct = expectation(description: "Product received")
        
        getProduct.getProduct(idProduct: 123) { response in
            
            // Then
            // Verify then output is as expected
            switch response.result {
            case .success(let getProduct):
                XCTAssertEqual(getProduct.productPrice, 45600)
                receivedProduct.fulfill()
            case .failure(let error):
                print(error.localizedDescription)
                XCTFail(error.localizedDescription)
            }
        }
        
        waitForExpectations(timeout: 5)
    }
}
