//
//  ResponseError.swift
//  Foursquare-client-ios
//
//  Created by Remi Robert on 13/01/2018.
//  Copyright © 2018 Remi Robert. All rights reserved.
//

public struct ResponseError: Codable {
    public let error: APIError

    enum CodingKeys: String, CodingKey {
        case error = "meta"
    }
}
