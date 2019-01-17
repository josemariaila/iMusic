//
//  Pagination.swift
//  iMusic
//
//  Created by José María Ila on 17/1/19.
//  Copyright © 2019 José María Ila. All rights reserved.
//

import Foundation

struct Pagination: Decodable {
    enum PaginationKeys: String, CodingKey {
        case itemsPerPage = "per_page"
        case items
        case page
        case totalPages = "pages"
    }

    let itemsPerPage: Int
    let items: Int
    let page: Int
    let totalPages: Int

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: PaginationKeys.self)
        let itemsPerPage = try container.decode(Int.self, forKey: .itemsPerPage)
        let items = try container.decode(Int.self, forKey: .items)
        let page = try container.decode(Int.self, forKey: .page)
        let totalPages = try container.decode(Int.self, forKey: .totalPages)

        self.itemsPerPage = itemsPerPage
        self.items = items
        self.page = page
        self.totalPages = totalPages
    }
}
