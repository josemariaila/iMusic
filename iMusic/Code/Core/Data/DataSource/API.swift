//
//  API.swift
//  iMusic
//
//  Created by José María Ila on 15/1/19.
//  Copyright © 2019 José María Ila. All rights reserved.
//

import Foundation

protocol APIStrategy {
    var baseURL: URL? { get }
    var apiKey: String { get }
    var format: String { get }
}

struct API {
    let strategy: APIStrategy
    var baseURL: URL? { return strategy.baseURL }
    var apiKey: String { return strategy.apiKey }
    var format: String { return strategy.format }
}
