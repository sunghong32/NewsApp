//
//  NewsWebViewController.swift
//  KeywordNews
//
//  Created by 민성홍 on 2022/10/19.
//

import UIKit
import SnapKit
import WebKit

final class NewsWebViewController: UIViewController {
    private let webView = WKWebView()

    private let news: News

    private let rightBarButtonItem = UIBarButtonItem(
        image: UIImage(systemName: "link"),
        style: .plain,
        target: NewsWebViewController.self,
        action: #selector(didTapRightBarButtonItem)
    )

    init(news: News) {
        self.news = news

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground

        setupNavigationBar()

        setupWebView()
    }
}

private extension NewsWebViewController {
    func setupNavigationBar() {
        navigationItem.title = news.title.htmlToString
        navigationItem.rightBarButtonItem = rightBarButtonItem
    }

    func setupWebView() {
        guard let linkURL = URL(string: news.link) else {

            navigationController?.popViewController(animated: true)

            return
        }

        view = webView

        let urlRequest = URLRequest(url: linkURL)

        webView.load(urlRequest)
    }

    @objc func didTapRightBarButtonItem() {
        UIPasteboard.general.string = news.link
    }
}
