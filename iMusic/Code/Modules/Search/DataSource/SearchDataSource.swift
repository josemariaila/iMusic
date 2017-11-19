//
//  SearchDataSource.swift
//  iMusic
//
//  Created by José María Ila on 19/11/17.
//  Copyright © 2017 José María Ila. All rights reserved.
//

import Foundation

typealias SuccessCompletionBlock = (_ object: Result) -> Void

protocol SearchDataSourceInterface: DataSource {
    func getArtists(with filter: String, success: @escaping SuccessCompletionBlock, failure: @escaping FailureCompletionBlock)
}

class SearchDataSource {
    
    private func searchUrl(with term: String) -> String? {
        var urlComponent = URLComponents(string: MusicAPI.iTunesUrl)
        urlComponent?.path = MusicAPI.search
        urlComponent?.queryItems = [URLQueryItem(name: "term", value: term),
                                   URLQueryItem(name: "entity", value: "musicArtist"),
                                   URLQueryItem(name: "attribute", value: "artistTerm")]
        
        return urlComponent?.string
    }
}

extension SearchDataSource: SearchDataSourceInterface {
    func getArtists(with filter: String, success: @escaping SuccessCompletionBlock, failure: @escaping FailureCompletionBlock) {
        guard let url = searchUrl(with: filter) else {
            return
        }
        executeRequest(url: url, success: success, failure: failure)
    }
}
