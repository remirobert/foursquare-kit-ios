//
//  APIRequest.swift
//  Foursquare-client-ios
//
//  Created by Remi Robert on 12/01/2018.
//  Copyright © 2018 Remi Robert. All rights reserved.
//

import Foundation

public class Request<T: Codable> {
    private let session: URLSession
    private let request: URLRequest
    private var task: URLSessionDataTask?

    public typealias CompletionResponse = ((Result) -> Swift.Void)

    public enum Result {
        case success(T)
        case failure(Error)
    }

    public enum Error {
        case noData
        case requestError(Swift.Error)
        case parsingError(Swift.Error)
    }

    public init(session: URLSession, request: URLRequest) {
        self.session = session
        self.request = request
    }

    public func cancel() {
        task?.cancel()
    }

    @discardableResult public func response(completion: @escaping CompletionResponse) -> Self {
        task = session.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(Result.failure(.requestError(error)))
                return
            }
            guard let data = data else {
                completion(Result.failure(.noData))
                return
            }

            let jsonDecoder = JSONDecoder()
            do {
                let response = try jsonDecoder.decode(T.self, from: data)
                completion(Result.success(response))
            } catch {
                completion(Result.failure(.parsingError(error)))
            }
        }
        task!.resume()
        return self
    }
}
