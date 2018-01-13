//
//  RequestProducer.swift
//  Foursquare-client-ios
//
//  Created by Remi Robert on 12/01/2018.
//  Copyright © 2018 Remi Robert. All rights reserved.
//

import Foundation

public protocol RequestProducable {
    func make(descriptor: APIRequestDescriptor) -> URLRequest
}

public class RequestProducer: RequestProducable {
    private let networkConfiguration: NetworkConfiguration
    private let authentification: ClientAuthentificable

    public init(networkConfiguration: NetworkConfiguration = .default,
                authentification: ClientAuthentificable) {
        self.networkConfiguration = networkConfiguration
        self.authentification = authentification
    }

    public func make(descriptor: APIRequestDescriptor) -> URLRequest {
        let mutableRequest = NSMutableURLRequest()
        mutableRequest.httpMethod = descriptor.endPoint.method.rawValue
        mutableRequest.url = buildURL(descriptor: descriptor)
        return mutableRequest as URLRequest
    }

    private func buildURL(descriptor: APIRequestDescriptor) -> URL? {
        var urlComponents = URLComponents()
        urlComponents.scheme = networkConfiguration.scheme
        urlComponents.host = networkConfiguration.host
        urlComponents.path = descriptor.endPoint.path

        var queryItems = descriptor.parameters.enumerated().map { _, element -> URLQueryItem in
            return URLQueryItem(name: element.key, value: element.value)
        }
        let auth = authentification.auth.enumerated().map { _, element -> URLQueryItem in
            return URLQueryItem(name: element.key, value: element.value)
        }
        queryItems.append(contentsOf: auth)
        queryItems.append(URLQueryItem(name: "v", value: networkConfiguration.version))
        urlComponents.queryItems = queryItems
        return urlComponents.url
    }
}
