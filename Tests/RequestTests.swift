//
//  RequestTests.swift
//  Foursquare-client-iosTests
//
//  Created by Remi Robert on 12/01/2018.
//  Copyright © 2018 Remi Robert. All rights reserved.
//

import XCTest
import FoursquareKit

private enum NetworkErrorTest: Error {
    case error
}

class RequestTests: XCTestCase {
    private let fakeRequest = URLRequest(url: URL(string: "https://foursquare.com")!)

    override func setUp() {
        super.setUp()
        continueAfterFailure = false
    }

    func testWithError() {
        let urlSessionMock = URLSessionMock(data: nil, error: NetworkErrorTest.error)
        let request = Request<ModelStub>(session: urlSessionMock, request: fakeRequest)

        var errorResponse: Error?
        request.response { result in
            switch result {
            case .failure(let error):
                switch error {
                case .requestError(let errorRequest):
                    errorResponse = errorRequest
                default: break
                }
            default: break
            }
        }
        XCTAssertNotNil(errorResponse)
        XCTAssertTrue(errorResponse! is NetworkErrorTest)
    }

    func testWithNoData() {
        let urlSessionMock = URLSessionMock(data: nil, error: nil)
        let request = Request<ModelStub>(session: urlSessionMock, request: fakeRequest)

        var errorNoData = false
        request.response { result in
            switch result {
            case .failure(let error):
                switch error {
                case .noData:
                    errorNoData = true
                default: break
                }
            default: break
            }
        }
        XCTAssertTrue(errorNoData)
    }

    func testWithValidData() {
        let data = "{\"city\":\"Paris\"}".data(using: String.Encoding.utf8)
        let urlSessionMock = URLSessionMock(data: data, error: nil)
        let request = Request<ModelStub>(session: urlSessionMock, request: fakeRequest)

        var modelResponse: ModelStub?
        request.response { result in
            switch result {
            case .success(let model):
                modelResponse = model
            default: break
            }
        }
        XCTAssertNotNil(modelResponse)
        XCTAssertEqual(modelResponse!.city, "Paris")
    }
}

private class ModelStub: Codable {
    let city: String
}
