//
//  SearchRepositoriesRequest.swift
//  zozo-ios-engineer-codecheck
//
//  Created by yuki.hamada on 2024/06/28.
//

import Foundation

/// APIRequest に則ってRequestを作成
///
/// ```
/// let request = GIthubAPI.SearchRepository(searchWord: "swift")
/// ```
struct CoordinateRecommendRequest: APIRequestProtocol {
    let searchWord: String

    init(searchWord: String) {
        self.searchWord = searchWord
    }

    typealias Response = CoordinateRecommendResponse

    // MARK: - APIRequestProtocol

    var baseURL: URL {
        guard let baseURL = URL(string: "http://0.0.0.0:8000") else { fatalError("error baseURL") }
        return baseURL
    }

    var path: String = "/deau/01"
    var method: HTTPMethod = .get
    var body: Data?

    var urlQueryItem: URLQueryItem {
        URLQueryItem(name: "", value: "")
    }
}
