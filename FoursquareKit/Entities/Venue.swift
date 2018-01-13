//
//  Venue.swift
//  VenueMap
//
//  Created by koogawa on 2015/07/21.
//  Copyright (c) 2015 Kosuke Ogawa. All rights reserved.
//

public struct Venue: Codable {
    public let id: String
    public let name: String
    public let location: Location
    public let categories: [VenueCategory]?
    public let canonicalUrl: String?
    public let contact: VenueContact

    public init(id: String,
                name: String,
                location: Location,
                categories: [VenueCategory]?,
                canonicalUrl: String?,
                contact: VenueContact) {
        self.id = id
        self.name = name
        self.location = location
        self.categories = categories
        self.canonicalUrl = canonicalUrl
        self.contact = contact
    }
}
