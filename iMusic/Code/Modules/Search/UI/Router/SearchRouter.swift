//
//  SearchRouter.swift
//  iMusic
//
//  Created by José María Ila on 19/11/17.
//  Copyright © 2017 José María Ila. All rights reserved.
//

import UIKit

protocol SearchRouter: class {
    func showError(with message: String, completion: AcceptActionCompletion?)
}

class SearchRouterImpl {
    let mainRouter: MainRouter

    init(mainRouter: MainRouter) {
        self.mainRouter = mainRouter
    }
}

extension SearchRouterImpl: SearchRouter {
    func showError(with message: String, completion: AcceptActionCompletion?) {
        mainRouter.presentAlertController(withMessage: message, completion: completion)
    }
}

extension SearchRouterImpl: RouterFactory {
    static func create(with mainRouter: MainRouter) -> UIViewController {
        let dataSource = SearchDataSourceImpl()
        let repository = SearchRepository(dataSource: dataSource)
        let interactor = SearchInteractor(repository: repository)
        let router = SearchRouterImpl(mainRouter: mainRouter)
        let viewModel = SearchViewModelImpl(interactor: interactor, router: router)
        let view = SearchViewController(viewModel: viewModel)
        
        repository.output = interactor
        interactor.output = viewModel
        
        return view
    }
}
