//
//  Location.swift
//  FoursquareAPIClient
//
//  Created by ogawa_kousuke on 2017/07/27.
//  Copyright © 2017年 Kosuke Ogawa. All rights reserved.
//

public struct Location: Codable {
    public let address: String?
    public let latitude: Double
    public let longitude: Double
    public let distance: Double?
    public let formattedAddress: [String]?

    private enum CodingKeys: String, CodingKey {
        case address
        case latitude = "lat"
        case longitude = "lng"
        case distance
        case formattedAddress
    }

    public init(address: String?,
                latitude: Double,
                longitude: Double,
                distance: Double?,
                formattedAddress: [String]?) {
        self.address = address
        self.latitude = latitude
        self.longitude = longitude
        self.distance = distance
        self.formattedAddress = formattedAddress
    }
}
