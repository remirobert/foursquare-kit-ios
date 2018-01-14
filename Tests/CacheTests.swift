//
//  CacheTests.swift
//  Tests
//
//  Created by Remi Robert on 14/01/2018.
//  Copyright © 2018 Remi Robert. All rights reserved.
//

import XCTest
import FoursquareKit

class CacheTests: XCTestCase {
    private let data = "{\"city\":\"Paris\"}".data(using: String.Encoding.utf8)!
    private var request: Request<ModelStub>!

    override func setUp() {
        super.setUp()
        continueAfterFailure = false

        let fakeRequest = URLRequest(url: URL(string: "https://foursquare.com")!)
        let urlSessionMock = URLSessionMock(data: data, error: nil, responseCode: 200)
        request = Request<ModelStub>(session: urlSessionMock, request: fakeRequest)
    }

    func testWithNoCache() {
        let cacheMock = CacheMock()
        var responses = [ModelStub]()

        request.cache(cacheMock).response { result in
            switch result {
            case .success(let response):
                responses.append(response)
            default: break
            }
        }

        XCTAssertFalse(responses.isEmpty)
        XCTAssertNotNil(cacheMock.dataSetted)
        XCTAssertEqual(cacheMock.setCacheKey, "https://foursquare.com")
        XCTAssertEqual(data, cacheMock.dataSetted!)
    }

    func testCacheWithData() {
        let cacheData = "{\"city\":\"London\"}".data(using: String.Encoding.utf8)!
        let cacheMock = CacheMock(cachedData: cacheData)
        var responses = [ModelStub]()

        request.cache(cacheMock).response { result in
            switch result {
            case .success(let response):
                responses.append(response)
            default: break
            }
        }

        XCTAssertFalse(responses.isEmpty)
        XCTAssertEqual(responses.count, 2)
        XCTAssertEqual(responses[0].city, "London")
        XCTAssertEqual(responses[1].city, "Paris")
        XCTAssertNotNil(cacheMock.dataSetted)
        XCTAssertEqual(cacheMock.getCacheKey, "https://foursquare.com")
        XCTAssertEqual(cacheMock.setCacheKey, "https://foursquare.com")
        XCTAssertEqual(data, cacheMock.dataSetted!)
    }
}

private class CacheMock: Cachable {
    private let cachedData: Data?
    private(set) var getCacheKey: String?
    private(set) var setCacheKey: String?
    private(set) var dataSetted: Data?

    init(cachedData: Data? = nil) {
        self.cachedData = cachedData
    }

    func data(forKey key: String, completion: ((Data?) -> Void)) {
        self.getCacheKey = key
        completion(cachedData)
    }

    func set(data: Data, forKey key: String) {
        self.dataSetted = data
        self.setCacheKey = key
    }
}
