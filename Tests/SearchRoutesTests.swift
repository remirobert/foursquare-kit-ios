//
//  SearchRoutesTests.swift
//  Foursquare-client-iosTests
//
//  Created by Remi Robert on 13/01/2018.
//  Copyright © 2018 Remi Robert. All rights reserved.
//

import XCTest
import FoursquareKit

class SearchRoutesTests: XCTestCase {
    private let authentificationFake = Authentification(clientId: "123", clientSecret: "456")

    override func setUp() {
        super.setUp()
        continueAfterFailure = false
    }

    func testSearchVenues() {
        let path = Bundle(for: SearchRoutesTests.self).path(forResource: "searchVenues", ofType: "json")
        let data = try! Data(contentsOf: URL(fileURLWithPath: path!), options: .mappedIfSafe)

        let urlSessionMock = URLSessionMock(data: data, error: nil)
        let client = Client(authentification: authentificationFake, urlSession: urlSessionMock)

        var responseVenues: [Venue]?
        client.search.venues(parameters: [:]).response { result in
            switch result {
            case .success(let data):
                responseVenues = data.response.venues
            default: break
            }
        }
        XCTAssertNotNil(responseVenues)
        XCTAssertTrue(responseVenues!.count == 30)
        XCTAssertEqual(responseVenues!.first!.name, "Empire State Building")
        XCTAssertEqual(responseVenues!.first!.id, "43695300f964a5208c291fe3")
    }

    func testSearchTrendingVenues() {
        let path = Bundle(for: SearchRoutesTests.self).path(forResource: "searchTrendingVenues", ofType: "json")
        let data = try! Data(contentsOf: URL(fileURLWithPath: path!), options: .mappedIfSafe)

        let urlSessionMock = URLSessionMock(data: data, error: nil)
        let client = Client(authentification: authentificationFake, urlSession: urlSessionMock)

        var responseVenues: [Venue]?
        client.search.trending(parameters: [:]).response { result in
            switch result {
            case .success(let data):
                responseVenues = data.response.venues
            default: break
            }
        }
        XCTAssertNotNil(responseVenues)
        XCTAssertTrue(responseVenues!.count == 1)
    }
}
