//
//  FetchSearch.swift
//  iMusic
//
//  Created by José María Ila on 15/1/19.
//  Copyright © 2019 José María Ila. All rights reserved.
//

import Foundation

struct FetchSearch: APIRequest {
    typealias Response = Search

    var resourceName: String {
        return "search"
    }

    let q: String?
    let type: String?

    init(with query: String? = nil, type: String? = nil) {
        self.q = query
        self.type = type
    }
}
