//
//  SearchRepository.swift
//  iMusic
//
//  Created by José María Ila on 19/11/17.
//  Copyright © 2017 José María Ila. All rights reserved.
//

import Foundation

protocol SearchRepositoryInputInterface {
    func getArtists(with filter: String)
    func getAlbums(from artist: String)
}

protocol SearchRepositoryOutputInterface: class {
    func onArtistsSuccess(artists: [Artist])
    func onArtistsFailure(error: Error)

    func onAlbumsSuccess(albums: [Album])
    func onAlbumsFailure(error: Error)
}

class SearchRepository {
    let dataSource: SearchDataSourceInterface
    weak var output: SearchRepositoryOutputInterface?
    
    init(dataSource: SearchDataSourceInterface) {
        self.dataSource = dataSource
    }
}

extension SearchRepository: SearchRepositoryInputInterface {
    func getArtists(with filter: String) {
        dataSource.getArtists(with: filter, success: { [weak self] result in
            guard let artists = result.results else {
                return
            }
            self?.output?.onArtistsSuccess(artists: artists)
            
        }, failure: { [weak self] error in
            self?.output?.onArtistsFailure(error: error)
        })
    }

    func getAlbums(from artist: String) {
        dataSource.getAlbums(from: artist, success: { [weak self] result in
            guard let albums = result.results else {
                return
            }
            self?.output?.onAlbumsSuccess(albums: albums)

        }, failure: { [weak self] error in
            self?.output?.onAlbumsFailure(error: error)
        })
    }
}
