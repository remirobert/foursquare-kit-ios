//
//  VenueCategory.swift
//  FoursquareAPIClient
//
//  Created by ogawa_kousuke on 2017/07/27.
//  Copyright © 2017年 Kosuke Ogawa. All rights reserved.
//

public struct VenueCategory: Codable {
    public let categoryId: String
    public let name: String
    public let icon: VenueCategoryIcon

    private enum CodingKeys: String, CodingKey {
        case categoryId = "id"
        case name
        case icon
    }

    public init(categoryId: String,
                name: String,
                icon: VenueCategoryIcon) {
        self.categoryId = categoryId
        self.name = name
        self.icon = icon
    }
}
