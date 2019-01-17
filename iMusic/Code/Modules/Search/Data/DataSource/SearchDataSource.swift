//
//  SearchDataSource.swift
//  iMusic
//
//  Created by José María Ila on 19/11/17.
//  Copyright © 2017 José María Ila. All rights reserved.
//

import Foundation

// MARK: - Definition

typealias SearchCompletionBlock = (Search) -> Void

protocol SearchDataSource: APIClient {
    func fetchSearch(with filter: String,
                     type: String,
                     success: @escaping SearchCompletionBlock,
                     failure: @escaping FailureCompletionBlock)
}

// MARK: - Implementation

class SearchDataSourceImpl: SearchDataSource {
    func fetchSearch(with filter: String,
                     type: String,
                     success: @escaping SearchCompletionBlock,
                     failure: @escaping FailureCompletionBlock) {

        execute(request: FetchSearch(with: filter, type: type)) { response in
            switch response {
            case .success(let search):
                success(search)

            case .failure(let error):
                failure(error)
            }
        }
    }
}
