//
//  GetProductsListTests.swift
//  StoreAppTests
//
//  Created by Федор Филимонов on 19.02.2021.
//

import XCTest
import Alamofire
@testable import StoreApp

class GetProductsListTests: XCTestCase {
    
    func testGetProductsList() throws {
        
        // Given
        // Initiate test data and system under test
        let requestFactory = RequestFactory()
        let getProductsList = requestFactory.makeGetProductsListRequestFactory()
        
        // When
        // Call system under test
        let receivedProductsList = expectation(description: "Products list received")
        
        getProductsList.getProductsList(pageNumber: 1, idCategory: 1) { response in
            
            // Then
            // Verify then output is as expected
            switch response.result {
            case .success(let getProductsList):
                XCTAssertEqual(getProductsList[0].idProduct, 123)
                XCTAssertEqual(getProductsList[0].productName, "Ноутбук")
                XCTAssertEqual(getProductsList[0].price, 45600)
                
                XCTAssertEqual(getProductsList[1].idProduct, 456)
                XCTAssertEqual(getProductsList[1].productName, "Мышка")
                XCTAssertEqual(getProductsList[1].price, 1000)
                
                receivedProductsList.fulfill()
            case .failure(let error):
                print(error.localizedDescription)
                XCTFail(error.localizedDescription)
            }
        }
        
        waitForExpectations(timeout: 5)
    }
}
