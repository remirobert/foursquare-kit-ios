//
//  Client+Constants.swift
//  Foursquare-client-ios
//
//  Created by Remi Robert on 12/01/2018.
//  Copyright © 2018 Remi Robert. All rights reserved.
//

public struct NetworkConfiguration {
    public let version: String
    public let scheme: String
    public let host: String

    public static var `default` =
        NetworkConfiguration(version: "20180102",
                             scheme: "https",
                             host: "api.foursquare.com")
}
