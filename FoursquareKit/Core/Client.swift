//
//  Client.swift
//  Foursquare-client-ios
//
//  Created by Remi Robert on 12/01/2018.
//  Copyright © 2018 Remi Robert. All rights reserved.
//

import Foundation

public class Client: ClientBase {
    public convenience init(authentification: ClientAuthentificable,
                            urlSession: URLSession = .shared) {
        let requestProducer = RequestProducer(authentification: authentification)
        self.init(authentification: authentification,
                  urlSession: urlSession,
                  requestProducer: requestProducer)
    }

    public init(authentification: ClientAuthentificable,
                urlSession: URLSession,
                requestProducer: RequestProducable) {
        super.init(urlSession: urlSession, requestProducer: requestProducer)
    }
}
