//
//  LastFMAPI.swift
//  iMusic
//
//  Created by José María Ila on 15/1/19.
//  Copyright © 2019 José María Ila. All rights reserved.
//

import Foundation

struct DiscogsAPI: APIStrategy {
    var baseURL: URL? {
        guard let url = URL(string: "https://api.discogs.com/database/") else { return nil }
        return url
    }

    var apiKey: String { return "eQRuSkRveyqhVDFIvYqwSFcdrEaEuecytuawxMsz" }
    var format: String { return "json" }
}
