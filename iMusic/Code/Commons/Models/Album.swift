//
//  Album.swift
//  iMusic
//
//  Created by José María Ila on 18/4/18.
//  Copyright © 2018 José María Ila. All rights reserved.
//

import ObjectMapper

class Album: Mappable {
    var wrapperType: String?
    var artistType: String?
    var artistName: String?
    var artistLinkUrl: String?
    var artistId: Int?
    var primaryGenreName: String?
    var primaryGenreId: Int?

    required init?(map: Map) {}

    func mapping(map: Map) {
        wrapperType <- map["wrapperType"]
        artistType <- map["artistType"]
        artistName <- map["artistName"]
        artistLinkUrl <- map["artistLinkUrl"]
        artistId <- map["artistId"]
        primaryGenreName <- map["primaryGenreName"]
        primaryGenreId <- map["primaryGenreId"]
    }
}
