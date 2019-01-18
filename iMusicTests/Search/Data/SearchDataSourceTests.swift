//
//  SearchDataSourceTests.swift
//  iMusicTests
//
//  Created by José María Ila on 18/1/19.
//  Copyright © 2019 José María Ila. All rights reserved.
//

import XCTest
@testable import iMusic

// MARK: - Implementation

class SearchDataSourceTests: XCTestCase {

    var dataSource: SearchDataSource!

    override func setUp() {
        super.setUp()

        dataSource = SearchDataSourceImpl()
    }
}

// MARK: - Tests

extension SearchDataSourceTests {

    func test_givenAFilterAndType_whenFetchSearch_thenReturnAnObjectSearchWithValues() {
        // Given
        let filter = "nirvana"
        let type = "masters"

        // When
        dataSource.fetchSearch(with: filter, type: type, success: { search in

            // Then
            XCTAssertNotNil(search.pagination)
            XCTAssertNotNil(search.results)
            XCTAssertTrue(search.results!.count > 0)

        }, failure: { _ in
            XCTFail()
        })
    }

    func test_givenAFilterAndType_whenFetchSearch_thenReturnAPaginationSuccessfully() {
        // Given
        let filter = "metallica"
        let type = "masters"

        // When
        dataSource.fetchSearch(with: filter, type: type, success: { search in

            // Then
            let pagination: Pagination = search.pagination!
            XCTAssertNotNil(pagination)
            XCTAssertEqual(pagination.items, 8486)
            XCTAssertEqual(pagination.itemsPerPage, 50)
            XCTAssertEqual(pagination.page, 1)
            XCTAssertEqual(pagination.totalPages, 170)

        }, failure: { _ in
            XCTFail()
        })
    }

    func test_givenAFilterAndType_whenFetchSearch_thenReturnAResultsSuccessfully() {
        // Given
        let filter = "metallica"
        let type = "masters"

        // When
        dataSource.fetchSearch(with: filter, type: type, success: { search in

            // Then
            let results: [SearchItem] = search.results!
            XCTAssertNotNil(results)
            XCTAssertEqual(results.count, 50)
            XCTAssertEqual(results[0].title, "Metallica - The Pigs Are Alright")

        }, failure: { _ in
            XCTFail()
        })
    }
}
