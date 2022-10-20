//
//  NewsRequestModel.swift
//  KeywordNews
//
//  Created by 민성홍 on 2022/10/19.
//

import Foundation

struct NewsRequestModel: Codable {
    // 시작 Index, 1 ~ 1000
    let start: Int

    // 검색 결과 출력 건수, 10 ~ 100
    let display: Int

    // 검색어
    let query: String
}
