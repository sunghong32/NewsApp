//
//  NewsListPresenter.swift
//  KeywordNews
//
//  Created by 민성홍 on 2022/10/18.
//

import UIKit

protocol NewsListProtocol: AnyObject {
    func setupNavigationBar()
    func setupLayout()
    func endRefreshing()
}

final class NewsListPresenter: NSObject {
    private weak var viewController: NewsListProtocol?

    init(viewController: NewsListProtocol) {
        self.viewController = viewController
    }

    func viewDidLoad() {
        viewController?.setupNavigationBar()
        viewController?.setupLayout() 
    }

    func didCalledRefresh() {
        viewController?.endRefreshing()
    }
}

extension NewsListPresenter: UITableViewDelegate {

}

extension NewsListPresenter: UITableViewDataSource {
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        15
    }

    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: NewsListTableViewCell.identifier,
            for: indexPath
        ) as? NewsListTableViewCell

        cell?.setup()

        return cell ?? UITableViewCell()
    }
}
