//
//  VenuesRoutes.swift
//  Foursquare-client-ios
//
//  Created by Remi Robert on 12/01/2018.
//  Copyright © 2018 Remi Robert. All rights reserved.
//

import Foundation

public class SearchRoutes {
    private let requestProducer: RequestProducable
    private let urlSession: URLSession

    public init(requestProducer: RequestProducable,
         urlSession: URLSession) {
        self.requestProducer = requestProducer
        self.urlSession = urlSession
    }

    public func venues(parameters: [String : String]) -> Request<Response<SearchResponse>> {
        let endPoint = APIEndPoint(path: "/v2/venues/search", method: .GET)
        let requestDescriptor = APIRequestDescriptor(endPoint: endPoint, parameters: parameters)
        let request = requestProducer.make(descriptor: requestDescriptor)
        return Request<Response<SearchResponse>>(session: self.urlSession, request: request)
    }

    public func trending(parameters: [String : String]) -> Request<Response<SearchResponse>> {
        let endPoint = APIEndPoint(path: "/v2/venues/trending", method: .GET)
        let requestDescriptor = APIRequestDescriptor(endPoint: endPoint, parameters: parameters)
        let request = requestProducer.make(descriptor: requestDescriptor)
        return Request<Response<SearchResponse>>(session: self.urlSession, request: request)
    }
}
