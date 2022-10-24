//
//  NewsListPresentManagerTests.swift
//  NewsListPresentManagerTests
//
//  Created by 민성홍 on 2022/10/18.
//

import XCTest
@testable import KeywordNews


final class NewsListPresentManagerTests: XCTestCase {
    var sut: NewsListPresenter!
    var viewController: MockNewsListViewController!
    var newsSearchManager: MockNewsSearchManager!

    override func setUp() {
        super.setUp()

        viewController = MockNewsListViewController()
        newsSearchManager = MockNewsSearchManager()

        sut = NewsListPresenter(viewController: viewController, newsSearchManager: newsSearchManager)
    }

    override func tearDown() {
        sut = nil
        viewController = nil
        newsSearchManager = nil

        super.tearDown()
    }

    func test_viewDidLoad가_요청될때() {
        sut.viewDidLoad()

        XCTAssertTrue(viewController.isCalledSetupNavigationBar)
        XCTAssertTrue(viewController.isCalledsetupLayout)
    }

    func test_didCalledRefresh가_요청될떄_request에_실패하면() {
        newsSearchManager.error = NSError() as Error

        sut.didCalledRefresh()

        XCTAssertFalse(viewController.isCalledreloadTableView)
        XCTAssertFalse(viewController.isCalledendRefreshing)
    }

    func test_didCalledRefresh가_요청될떄_request에_성공하면() {
        newsSearchManager.error = nil

        sut.didCalledRefresh()

        XCTAssertTrue(viewController.isCalledreloadTableView)
        XCTAssertTrue(viewController.isCalledendRefreshing)
    }
}
