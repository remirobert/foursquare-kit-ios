//
//  VenueRoutes.swift
//  Foursquare-client-ios
//
//  Created by Remi Robert on 12/01/2018.
//  Copyright © 2018 Remi Robert. All rights reserved.
//

import Foundation

public class VenueRoutes {
    private let requestProducer: RequestProducable
    private let urlSession: URLSession

    public init(requestProducer: RequestProducable,
                urlSession: URLSession) {
        self.requestProducer = requestProducer
        self.urlSession = urlSession
    }

    public func details(id: String) -> Request<Response<SearchResponseDetail>> {
        let endPoint = APIEndPoint(path: "/v2/venues/\(id)", method: .GET)
        let requestDescriptor = APIRequestDescriptor(endPoint: endPoint, parameters: [:])
        let request = requestProducer.make(descriptor: requestDescriptor)
        return Request<Response<SearchResponseDetail>>(session: self.urlSession, request: request)
    }

    public func photos(id: String) -> Request<Response<VenuePhotosResponse>> {
        let endPoint = APIEndPoint(path: "/v2/venues/\(id)/photos", method: .GET)
        let requestDescriptor = APIRequestDescriptor(endPoint: endPoint, parameters: [:])
        let request = requestProducer.make(descriptor: requestDescriptor)
        return Request<Response<VenuePhotosResponse>>(session: self.urlSession, request: request)
    }
}
