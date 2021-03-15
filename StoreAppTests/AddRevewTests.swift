//
//  AddRevewTests.swift
//  StoreAppTests
//
//  Created by Федор Филимонов on 04.03.2021.
//

import XCTest
import Alamofire
@testable import StoreApp

class AddReviewTests: XCTestCase {
    
    func testAddReview() throws {
        
        // Given
        // Initiate test data and system under test
        let requestFactory = RequestFactory()
        let addReview = requestFactory.makeAddReviewRequestFactory()
        
        // When
        // Call system under test
        let addedReview = expectation(description: "Review added")
        
        addReview.addReview(idUser: 123, text: "Review text") { response in
            
            // Then
            // Verify then output is as expected
            switch response.result {
            case .success(let addReview):
                XCTAssertEqual(addReview.result, 1)
                XCTAssertEqual(addReview.userMessage, "Ваш отзыв был передан на модерацию")
                addedReview.fulfill()
            case .failure(let error):
                print(error.localizedDescription)
                XCTFail(error.localizedDescription)
            }
        }
        
        waitForExpectations(timeout: 5)
    }
}
