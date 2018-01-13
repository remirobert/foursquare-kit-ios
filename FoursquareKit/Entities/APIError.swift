//
//  APIError.swift
//  Foursquare-client-ios
//
//  Created by Remi Robert on 13/01/2018.
//  Copyright © 2018 Remi Robert. All rights reserved.
//

public struct APIError: Codable {
    public let code: Int
    public let errorDetail: String
    public let errorType: String

    public init(code: Int,
                errorDetail: String,
                errorType: String) {
        self.code = code
        self.errorDetail = errorDetail
        self.errorType = errorType
    }
}
