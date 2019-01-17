//
//  SearchPresenter.swift
//  iMusic
//
//  Created by José María Ila on 19/11/17.
//  Copyright © 2017 José María Ila. All rights reserved.
//

import Foundation

protocol SearchViewModel: class {
    var didUpdateList: (() -> Void)? { get set }
    var rows: Int { get }
    func fetchSearch(with filter: String?)
    func searchViewModel(for indexPath: IndexPath) -> SearchCellViewModel?
}

class SearchViewModelImpl {
    private let interactor: SearchInteractorInput
    private let router: SearchRouter

    var results: [SearchItem] = []
    var pagination: Pagination?
    var viewModels: [SearchCellViewModel] = []
    var didUpdateList: (() -> Void)?
    
    init(interactor: SearchInteractorInput, router: SearchRouter) {
        self.interactor = interactor
        self.router = router
    }
}

// MARK: - Private methods

private extension SearchViewModelImpl {
    func createViewModels() {
        viewModels = results.compactMap { item -> SearchCellViewModel? in
            return SearchCellViewModel(title: item.title, cover: item.coverImage)
        }
    }
}

// MARK: - SearchViewModel

extension SearchViewModelImpl: SearchViewModel {
    var rows: Int {
        return viewModels.count
    }
    
    func fetchSearch(with filter: String?) {
        guard let filter = filter else { return }
        interactor.fetchSearch(with: filter)
    }
    
    func searchViewModel(for indexPath: IndexPath) -> SearchCellViewModel? {
        guard indexPath.row < viewModels.count else { return nil }
        return viewModels[indexPath.row]
    }
}

// MARK: - SearchInteractorOutput

extension SearchViewModelImpl: SearchInteractorOutput {
    func onSuccess(search: Search) {
        guard let results = search.results, let pagination = search.pagination else { return }
        self.results = results
        self.pagination = pagination

        createViewModels()
        didUpdateList?()
    }
    
    func onFailure(error: String) {
        router.showError(with: error, completion: { _ in
            // TODO: Manage errors
        })
    }
}
