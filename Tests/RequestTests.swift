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
        let urlSessionMock = URLSessionMock(data: nil, error: NetworkErrorTest.error, responseCode: 200)
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
        let urlSessionMock = URLSessionMock(data: nil, error: nil, responseCode: 200)
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
        let urlSessionMock = URLSessionMock(data: data, error: nil, responseCode: 200)
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

    func testWithAPIError() {
        let data = Data.from(localRessource: "responseError")
        let urlSessionMock = URLSessionMock(data: data, error: nil, responseCode: 400)
        let request = Request<ModelStub>(session: urlSessionMock, request: fakeRequest)

        var apiError: APIError?
        request.response { result in
            print(result)
            switch result {
            case .failure(let error):
                switch error {
                case .apiError(let responseError):
                    apiError = responseError.error
                default: break
                }
            default: break
            }
        }
        XCTAssertNotNil(apiError)
        XCTAssertEqual(apiError!.code, 400)
        XCTAssertEqual(apiError!.errorDetail, "Value abc is invalid for venue id")
        XCTAssertEqual(apiError!.errorType, "param_error")
    }
}

