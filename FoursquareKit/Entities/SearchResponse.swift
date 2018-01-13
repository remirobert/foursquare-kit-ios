//
//  SearchResponse.swift
//  FoursquareAPIClient
//
//  Created by ogawa_kousuke on 2017/07/27.
//  Copyright © 2017年 Kosuke Ogawa. All rights reserved.
//

public struct SearchResponse : Codable {
    public let venues: [Venue]
}
