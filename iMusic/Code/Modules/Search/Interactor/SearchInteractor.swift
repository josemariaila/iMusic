//
//  SearchInteractor.swift
//  iMusic
//
//  Created by José María Ila on 19/11/17.
//  Copyright © 2017 José María Ila. All rights reserved.
//

import Foundation

protocol SearchInteractorInputInterface {
    func getArtists(with filter: String)
    func getAlbums(from artist: String)
}

protocol SearchInteractorOutputInteface: class {
    func onArtists(artists: [Artist])
    func onFailure(error: String)
}

class SearchInteractor {
    let repository: SearchRepositoryInputInterface
    weak var output: SearchInteractorOutputInteface?
    
    init(repository: SearchRepositoryInputInterface) {
        self.repository = repository
    }
}

extension SearchInteractor: SearchInteractorInputInterface {
    func getArtists(with filter: String) {
        repository.getArtists(with: filter)
    }

    func getAlbums(from artist: String) {
        
    }
}

extension SearchInteractor: SearchRepositoryOutputInterface {
    func onArtistsSuccess(artists: [Artist]) {
        output?.onArtists(artists: artists)
    }
    
    func onArtistsFailure(error: Error) {
        output?.onFailure(error: error.localizedDescription)
    }
}
