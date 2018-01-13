//
//  FakeData.swift
//  Foursquare-client-iosTests
//
//  Created by Remi Robert on 13/01/2018.
//  Copyright © 2018 Remi Robert. All rights reserved.
//

import Foundation

extension Data {
    static func from(localRessource ressource: String) -> Data {
        let path = Bundle(for: SearchRoutesTests.self).path(forResource: ressource, ofType: "json")
        return try! Data(contentsOf: URL(fileURLWithPath: path!), options: .mappedIfSafe)
    }
}
