//
//  SearchRouter.swift
//  iMusic
//
//  Created by José María Ila on 19/11/17.
//  Copyright © 2017 José María Ila. All rights reserved.
//

import UIKit

protocol SearchRouterInterface: class {
    func showError(withMessage: String, completion: AcceptActionCompletion?)
}

class SearchRouter {
    let mainRouter: MainRouterInterface
    weak var presenter: SearchPresenterInterface?
    
    init(mainRouter: MainRouterInterface) {
        self.mainRouter = mainRouter
    }
}

extension SearchRouter: SearchRouterInterface {
    
    func showError(withMessage: String, completion: AcceptActionCompletion?) {
        mainRouter.presentAlertController(withMessage: withMessage, completion: completion)
    }
}

extension SearchRouter: RouterFactory {
    
    static func create(withMainRouter mainRouter: MainRouterInterface) -> UIViewController {
        let dataSource = SearchDataSource()
        let repository = SearchRepository(dataSource: dataSource)
        let interactor = SearchInteractor(repository: repository)
        let router = SearchRouter(mainRouter: mainRouter)
        let presenter = SearchPresenter(interactor: interactor, router: router)
        let view = SearchViewController(presenter: presenter)
        
        repository.output = interactor
        interactor.output = presenter
        presenter.searchView = view
        router.presenter = presenter
        
        return view
    }
}
