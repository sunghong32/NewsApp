//
//  MockNewsSearchManager.swift
//  KeywordNewsTests
//
//  Created by 민성홍 on 2022/10/21.
//

import Foundation
@testable import KeywordNews

final class MockNewsSearchManager: NewsSearchManagerProtocol {
    var error: Error?
    var isCalledRequest = false

    func request(
        from keyword: String,
        start: Int,
        display: Int,
        completionHandler: @escaping ([KeywordNews.News]) -> Void) {
            isCalledRequest = true

            if error == nil {
                completionHandler([])
            }
    }
}
