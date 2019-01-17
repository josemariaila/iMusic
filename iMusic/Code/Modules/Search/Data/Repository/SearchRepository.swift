//
//  SearchRepository.swift
//  iMusic
//
//  Created by José María Ila on 19/11/17.
//  Copyright © 2017 José María Ila. All rights reserved.
//

import Foundation

protocol SearchRepositoryInput {
    func fetchSearch(with filter: String, type: String)
}

protocol SearchRepositoryOutput: class {
    func onSuccess(search: Search)
    func onFailure(error: Error)
}

class SearchRepository {
    let dataSource: SearchDataSource
    weak var output: SearchRepositoryOutput?
    
    init(dataSource: SearchDataSource) {
        self.dataSource = dataSource
    }
}

extension SearchRepository: SearchRepositoryInput {
    func fetchSearch(with filter: String, type: String) {
        dataSource.fetchSearch(with: filter, type: type, success: { [weak self] search in
            self?.output?.onSuccess(search: search)

        }, failure: { [weak self] error in
            self?.output?.onFailure(error: error)
        })
    }
}
