//
//  SearchInteractor.swift
//  iMusic
//
//  Created by José María Ila on 19/11/17.
//  Copyright © 2017 José María Ila. All rights reserved.
//

import Foundation

protocol SearchInteractorInput {
    func fetchSearch(with filter: String)
}

protocol SearchInteractorOutput: class {
    func onSuccess(search: Search)
    func onFailure(error: String)
}

class SearchInteractor {
    let repository: SearchRepositoryInput
    weak var output: SearchInteractorOutput?
    
    init(repository: SearchRepositoryInput) {
        self.repository = repository
    }
}

extension SearchInteractor: SearchInteractorInput {
    func fetchSearch(with filter: String) {
        repository.fetchSearch(with: filter, type: "masters")
    }
}

extension SearchInteractor: SearchRepositoryOutput {
    func onSuccess(search: Search) {
        output?.onSuccess(search: search)
    }

    func onFailure(error: Error) {
        output?.onFailure(error: error.localizedDescription)
    }
}
