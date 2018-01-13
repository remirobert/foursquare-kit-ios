//
//  Photos.swift
//  VenueProviderService
//
//  Created by Remi Robert on 05/01/2018.
//  Copyright © 2018 Remi Robert. All rights reserved.
//

public struct Photo: Codable {
    public let prefix: String
    public let suffix: String
    public let width: Int
    public let height: Int

    public func url(width: Int) -> String {
        return "\(prefix)width\(width)\(suffix)"
    }

    public init(prefix: String,
                suffix: String,
                width: Int,
                height: Int) {
        self.prefix = prefix
        self.suffix = suffix
        self.width = width
        self.height = height
    }
}
