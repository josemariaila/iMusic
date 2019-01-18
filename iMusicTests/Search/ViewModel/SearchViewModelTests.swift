//
//  SearchViewModelTests.swift
//  iMusicTests
//
//  Created by José María Ila on 18/1/19.
//  Copyright © 2019 José María Ila. All rights reserved.
//

import XCTest
@testable import iMusic

// MARK: - Implementation

class SearchViewModelTests: XCTestCase {

    var viewModel: SearchViewModel!

    override func setUp() {
        super.setUp()

        let mainRouter = MainRouterImpl(window: UIWindow())
        let dataSource = SearchDataSourceImpl()
        let repository = SearchRepository(dataSource: dataSource)
        let interactor = SearchInteractor(repository: repository)
        let router = SearchRouterImpl(mainRouter: mainRouter)
        viewModel = SearchViewModelImpl(interactor: interactor, router: router)

        repository.output = interactor
//        interactor.output = viewModel
    }

}

// MARK: - SearchViewModelTests

extension SearchViewModelTests {

}
