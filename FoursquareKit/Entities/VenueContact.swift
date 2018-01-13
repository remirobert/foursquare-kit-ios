//
//  VenueContact.swift
//  Foursquare-client-ios
//
//  Created by Remi Robert on 13/01/2018.
//  Copyright © 2018 Remi Robert. All rights reserved.
//

public struct VenueContact: Codable {
    public let phone: String?
    public let formattedPhone: String?
    public let twitter: String?
    public let facebook: String?
    public let facebookUsername: String?
    public let facebookName: String?

    public init(phone: String?,
                formattedPhone: String?,
                twitter: String?,
                facebook: String?,
                facebookUsername: String?,
                facebookName: String?) {
        self.phone = phone
        self.formattedPhone = formattedPhone
        self.twitter = twitter
        self.facebook = facebook
        self.facebookUsername = facebookUsername
        self.facebookName = facebookName
    }
}
