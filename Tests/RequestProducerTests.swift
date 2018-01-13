//
//  RequestProducerTests.swift
//  Foursquare-client-iosTests
//
//  Created by Remi Robert on 13/01/2018.
//  Copyright © 2018 Remi Robert. All rights reserved.
//

import XCTest
import FoursquareKit

class RequestProducerTests: XCTestCase {
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
    }

    func testProduceRequest() {
        let authentification = Authentification(clientId: "123", clientSecret: "456")
        let endPoint = APIEndPoint(path: "/venues", method: HTTPMethod.GET)
        let apiDescriptor = APIRequestDescriptor(endPoint: endPoint, parameters: ["city" : "Paris"])
        let requestProducer = RequestProducer(authentification: authentification)

        let request = requestProducer.make(descriptor: apiDescriptor)
        let expectedURL = "https://api.foursquare.com/venues?city=Paris&client_secret=456&client_id=123&v=20180102"

        XCTAssertNotNil(request.url)
        XCTAssertEqual(request.url!.absoluteString, expectedURL)
        XCTAssertEqual(request.httpMethod, HTTPMethod.GET.rawValue)
    }
}
