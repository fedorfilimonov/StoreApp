//
//  GetReviewsTests.swift
//  StoreApp
//
//  Created by Федор Филимонов on 05.03.2021.
//

import XCTest
import Alamofire
@testable import StoreApp

//class GetReviewsTests: XCTestCase {
//
//    func testGetReviews() throws {
//
//        // Given
//        // Initiate test data and system under test
//        let requestFactory = RequestFactory()
//        let getReviews = requestFactory.makeGetReviewsRequestFactory()
//
//        // When
//        // Call system under test
//        let receivedReview = expectation(description: "Review received")
//
//        getReviews.getReviews(pageNumber: 1, idProduct: 123) { response in
//
//            // Then
//            // Verify then output is as expected
//            switch response.result {
//            case .success(let receivedReview):
//                XCTAssertEqual(receivedReview.result, 1)
//                receivedReview.fulfill()
//            case .failure(let error):
//                print(error.localizedDescription)
//                XCTFail(error.localizedDescription)
//            }
//        }
//
//        waitForExpectations(timeout: 5)
//    }
//}
