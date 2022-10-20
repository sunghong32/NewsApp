//
//  NewsSearchManager.swift
//  KeywordNews
//
//  Created by 민성홍 on 2022/10/19.
//

import Foundation
import Alamofire

protocol NewsSearchManagerProtocol {
    func request(
        from keyword: String,
        start: Int,
        display: Int,
        completionHandler: @escaping ([News]) -> Void
    )
}

struct NewsSearchManager {
    func request(
        from keyword: String,
        start: Int,
        display: Int,
        completionHandler: @escaping ([News]) -> Void
    ) {
        guard let url = URL(string: "https://openapi.naver.com/v1/search/news.json") else { return }

        let parameters = NewsRequestModel(start: start, display: display, query: keyword)

        let headers: HTTPHeaders = [
            "X-Naver-Client-Id": "8MvFV8is48lVgVvgpsqq",
            "X-Naver-Client-Secret": "E9HyHMDLBW"
        ]

        AF.request(
            url,
            method: .get,
            parameters: parameters,
            headers: headers
        )
        .responseDecodable(of: NewsResponseModel.self) { response in
            switch response.result {
                case .success(let result):
                    completionHandler(result.items)
                case .failure(let error):
                    print(error)
            }
        }
        .resume()
    }
}
