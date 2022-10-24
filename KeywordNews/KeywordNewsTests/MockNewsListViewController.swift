//
//  MockNewsListViewController.swift
//  KeywordNewsTests
//
//  Created by 민성홍 on 2022/10/21.
//

import Foundation
@testable import KeywordNews

final class MockNewsListViewController: NewsListProtocol {
    var isCalledSetupNavigationBar = false
    var isCalledsetupLayout = false
    var isCalledendRefreshing = false
    var isCalledmoveToNewsWebViewController = false
    var isCalledreloadTableView = false

    func setupNavigationBar() {
        isCalledSetupNavigationBar = true
    }

    func setupLayout() {
        isCalledsetupLayout = true
    }

    func endRefreshing() {
        isCalledendRefreshing = true
    }

    func moveToNewsWebViewController(with news: KeywordNews.News) {
        isCalledmoveToNewsWebViewController = true
    }

    func reloadTableView() {
        isCalledreloadTableView = true
    }
}
