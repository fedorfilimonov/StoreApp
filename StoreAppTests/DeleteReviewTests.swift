//
//  DeleteReviewTests.swift
//  StoreApp
//
//  Created by Федор Филимонов on 05.03.2021.
//

import XCTest
import Alamofire
@testable import StoreApp

class DeleteReviewTests: XCTestCase {
    
    func testDeleteReview() throws {
        
        // Given
        // Initiate test data and system under test
        let requestFactory = RequestFactory()
        let deleteReview = requestFactory.makeDeleteReviewRequestFactory()
        
        // When
        // Call system under test
        let deletedReview = expectation(description: "Review deleted")
        
        deleteReview.deleteReview(idComment: 123) { response in
            
            // Then
            // Verify then output is as expected
            switch response.result {
            case .success(let deleteReview):
                XCTAssertEqual(deleteReview.result, 1)
                deletedReview.fulfill()
            case .failure(let error):
                print(error.localizedDescription)
                XCTFail(error.localizedDescription)
            }
        }
        
        waitForExpectations(timeout: 5)
    }
}
