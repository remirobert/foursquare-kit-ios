//
//  Cachable.swift
//  FoursquareKit
//
//  Created by Remi Robert on 14/01/2018.
//  Copyright © 2018 Remi Robert. All rights reserved.
//

public protocol Cachable {
    func data(forKey key: String) -> Data?
    func set(data: Data, forKey key: String)
}
