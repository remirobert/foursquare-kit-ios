//
//  VenueRoutesTests.swift
//  Foursquare-client-iosTests
//
//  Created by Remi Robert on 13/01/2018.
//  Copyright © 2018 Remi Robert. All rights reserved.
//

import XCTest
import FoursquareKit

class VenueRoutesTests: XCTestCase {
    private let authentificationFake = Authentification(clientId: "123", clientSecret: "456")

    override func setUp() {
        super.setUp()
        continueAfterFailure = false
    }

    func testVenueDetails() {
        let data = Data.from(localRessource: "venueDetails")
        let urlSessionMock = URLSessionMock(data: data, error: nil, responseCode: 200)
        let client = FoursquareClient(authentification: authentificationFake, urlSession: urlSessionMock)

        var venue: Venue?
        client.venue.details(id: "123").response { result in
            print("result : \(result)")
            switch result {
            case .success(let data):
                venue = data.response.venue
            default: break
            }
        }
        XCTAssertNotNil(venue)
        XCTAssertEqual(venue!.name, "Vanessa's Dumpling House")
        XCTAssertEqual(venue!.id, "49eeaf08f964a52078681fe3")
        XCTAssertEqual(venue!.canonicalUrl, "https://foursquare.com/v/vanessas-dumpling-house/49eeaf08f964a52078681fe3")
        XCTAssertEqual(venue!.location.latitude, 40.718301364039064)
        XCTAssertEqual(venue!.location.longitude, -73.99192996850243)
        XCTAssertEqual(venue!.location.address, "118 Eldridge St")
        XCTAssertEqual(venue!.location.formattedAddress!, ["118 Eldridge St (btwn Broome & Grand St)", "New York, NY 10002", "United States"])
        XCTAssertEqual(venue!.contact.phone, "+12126258008")
        XCTAssertEqual(venue!.contact.formattedPhone, "+1 212-625-8008")
        XCTAssertEqual(venue!.contact.twitter, "vanessadumpling")
        XCTAssertEqual(venue!.contact.facebook, "460834103959975")
        XCTAssertEqual(venue!.contact.facebookUsername, "VanessasDumplings")
        XCTAssertEqual(venue!.contact.facebookName, "Vanessa's Dumpling House")
    }

    func testVenuePhotos() {
        let data = Data.from(localRessource: "venuePhotos")
        let urlSessionMock = URLSessionMock(data: data, error: nil, responseCode: 200)
        let client = FoursquareClient(authentification: authentificationFake, urlSession: urlSessionMock)

        var photos: [Photo]?
        client.venue.photos(id: "123").response { result in
            switch result {
            case .success(let data):
                photos = data.response.photos.items
            default: break
            }
        }

        let expectedURL = "https://igx.4sqi.net/img/general/width320/26739064_mUxQ4CGrobFqwpcAIoX6YoAdH0xCDT4YAxaU6y65PPI.jpg"

        XCTAssertNotNil(photos)
        XCTAssertEqual(photos!.first!.prefix, "https://igx.4sqi.net/img/general/")
        XCTAssertEqual(photos!.first!.suffix, "/26739064_mUxQ4CGrobFqwpcAIoX6YoAdH0xCDT4YAxaU6y65PPI.jpg")
        XCTAssertEqual(photos!.first!.width, 612)
        XCTAssertEqual(photos!.first!.height, 612)
        XCTAssertEqual(photos!.first!.url(width: 320), expectedURL)
    }
}

