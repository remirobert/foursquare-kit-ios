//
//  RequestDescriptor.swift
//  Foursquare-client-ios
//
//  Created by Remi Robert on 12/01/2018.
//  Copyright © 2018 Remi Robert. All rights reserved.
//

import Foundation

public enum HTTPMethod: String {
    case GET
    case POST
}

public struct APIEndPoint {
    public let path: String
    public let method: HTTPMethod

    public init(path: String,
                method: HTTPMethod) {
        self.path = path
        self.method = method
    }
}

public struct APIRequestDescriptor {
    public let endPoint: APIEndPoint
    public let parameters: [String:String]

    public init(endPoint: APIEndPoint,
                parameters: [String:String]) {
        self.endPoint = endPoint
        self.parameters = parameters
    }
}
