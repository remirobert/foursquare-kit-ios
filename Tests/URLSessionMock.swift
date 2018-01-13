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
    private let dataTask: URLSessionDataTask

    init(data: Data?,
         error: Error?,
         dataTask: URLSessionDataTask = URLSessionDataTaskStub()) {
        self.data = data
        self.error = error
        self.dataTask = dataTask
    }

    override func dataTask(with request: URLRequest,
                           completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        completionHandler(self.data, nil, self.error)
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
