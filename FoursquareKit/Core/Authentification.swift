//
//  Authentification.swift
//  Foursquare-client-ios
//
//  Created by Remi Robert on 12/01/2018.
//  Copyright © 2018 Remi Robert. All rights reserved.
//

public protocol ClientAuthentificable {
    var auth: [String : String] { get }
}

public struct Authentification: ClientAuthentificable {
    public let clientId: String
    public let clientSecret: String

    public var auth: [String : String] {
        return [
            "client_id": clientId,
            "client_secret": clientSecret
        ]
    }

    public init(clientId: String,
                clientSecret: String) {
        self.clientId = clientId
        self.clientSecret = clientSecret
    }
}

public struct AuthentificationToken: ClientAuthentificable {
    public let token: String

    public var auth: [String : String] {
        return [
            "token": token
        ]
    }

    public init(token: String) {
        self.token = token
    }
}
