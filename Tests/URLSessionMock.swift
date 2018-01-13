//
//  URLSessionMock.swift
//  Foursquare-client-iosTests
//
//  Created by Remi Robert on 13/01/2018.
//  Copyright © 2018 Remi Robert. All rights reserved.
//

import Foundation

class URLSessionMock: URLSession {
    private let data: Data?
    private let error: Error?
    private let responseCode: Int
    private let dataTask: URLSessionDataTask

    init(data: Data?,
         error: Error?,
         responseCode: Int,
         dataTask: URLSessionDataTask = URLSessionDataTaskStub()) {
        self.data = data
        self.error = error
        self.responseCode = responseCode
        self.dataTask = dataTask
    }

    override func dataTask(with request: URLRequest,
                           completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        let response = HTTPURLResponse(url: request.url!,
                                       statusCode: responseCode,
                                       httpVersion: nil,
                                       headerFields: nil)
        completionHandler(self.data, response, self.error)
        return dataTask
    }
}

class URLSessionDataTaskStub: URLSessionDataTask {
    private(set) var isCanceled = false

    override func resume() {}

    override func cancel() {
        isCanceled = true
    }
}

