//
//  VenueCategoryIcon.swift
//  FoursquareAPIClient
//
//  Created by ogawa_kousuke on 2017/07/27.
//  Copyright © 2017年 Kosuke Ogawa. All rights reserved.
//

public struct VenueCategoryIcon: Codable {
    public let prefix: String
    public let suffix: String

    public var categoryIconUrl: String {
        return String(format: "%@%d%@", prefix, 88, suffix)
    }

    public init(prefix: String, suffix: String) {
        self.prefix = prefix
        self.suffix = suffix
    }
}
