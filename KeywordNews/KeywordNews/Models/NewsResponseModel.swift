//
//  NewsResponseModel.swift
//  KeywordNews
//
//  Created by 민성홍 on 2022/10/19.
//

import Foundation

struct NewsResponseModel: Decodable {
    var items: [News] = []
}

struct News: Decodable {
    let title: String
    let link: String
    let description: String
    let pubDate: String
}
