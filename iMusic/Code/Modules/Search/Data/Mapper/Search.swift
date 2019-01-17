//
//  Search.swift
//  iMusic
//
//  Created by José María Ila on 14/1/19.
//  Copyright © 2019 José María Ila. All rights reserved.
//

import Foundation

// MARK: - Implementation
struct Search: Decodable {
    let pagination: Pagination?
    let results: [SearchItem]?
}

struct SearchItem: Decodable {
    enum SearchItemKeys: String, CodingKey {
        case title
        case label
        case barcode
        case coverImage = "cover_image"
    }

    let title: String
    let label: [String]
    let barcode: [String]
    let coverImage: String

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: SearchItemKeys.self)
        let title = try container.decode(String.self, forKey: .title)
        let label = try container.decode([String].self, forKey: .label)
        let barcode = try container.decode([String].self, forKey: .barcode)
        let coverImage = try container.decode(String.self, forKey: .coverImage)

        self.title = title
        self.label = label
        self.barcode = barcode
        self.coverImage = coverImage
    }
}
