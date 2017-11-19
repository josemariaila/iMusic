//
//  SearchPresenter.swift
//  iMusic
//
//  Created by José María Ila on 19/11/17.
//  Copyright © 2017 José María Ila. All rights reserved.
//

import Foundation

protocol SearchPresenterInterface: class {
    var rows: Int { get }
    func getArtists(with filter: String?)
    func searchViewModel(for indexPath: IndexPath) -> SearchCellViewModel?
}

class SearchPresenter {
    let interactor: SearchInteractorInputInterface
    let router: SearchRouterInterface
    weak var searchView: SearchViewInterface?
    var artists: [Artist] = []
    var viewModels: [SearchCellViewModel] = []
    
    init(interactor: SearchInteractorInputInterface, router: SearchRouterInterface) {
        self.interactor = interactor
        self.router = router
    }
}

private extension SearchPresenter {
    func createViewModels() {
        viewModels = artists.flatMap { artist -> SearchCellViewModel? in
            guard let name = artist.artistName, let style = artist.primaryGenreName else {
                return nil
            }
            return SearchCellViewModel(name: name, style: style)
        }
    }
}

extension SearchPresenter: SearchPresenterInterface {
    var rows: Int {
        return viewModels.count
    }
    
    func getArtists(with filter: String?) {
        guard let text = filter else {
            return
        }
        interactor.getArtists(with: text)
    }
    
    func searchViewModel(for indexPath: IndexPath) -> SearchCellViewModel? {
        guard indexPath.row < viewModels.count else {
            return nil
        }
        return viewModels[indexPath.row]
    }
}

extension SearchPresenter: SearchInteractorOutputInteface {
    
    func onArtists(artists: [Artist]) {
        self.artists = artists
        createViewModels()
        searchView?.reloadData()
    }
    
    func onFailure(error: String) {
        router.showError(withMessage: error, completion: { _ in
            
        })
    }
}
