//
//  Result.swift
//  iMusic
//
//  Created by José María Ila on 19/11/17.
//  Copyright © 2017 José María Ila. All rights reserved.
//

import ObjectMapper

class Result: Mappable {
    var resultCount: String?
    var results: [Artist]?
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        resultCount <- map["resultCount"]
        results <- map["results"]
    }
}
