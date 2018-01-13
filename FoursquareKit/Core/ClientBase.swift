//
//  ClientBase.swift
//  Foursquare-client-ios
//
//  Created by Remi Robert on 12/01/2018.
//  Copyright © 2018 Remi Robert. All rights reserved.
//

import Foundation

public class ClientBase {
    public let search: SearchRoutes
    public let venue: VenueRoutes

    public init(urlSession: URLSession,
                requestProducer: RequestProducable) {
        self.search = SearchRoutes(requestProducer: requestProducer, urlSession: urlSession)
        self.venue = VenueRoutes(requestProducer: requestProducer, urlSession: urlSession)
    }
}
