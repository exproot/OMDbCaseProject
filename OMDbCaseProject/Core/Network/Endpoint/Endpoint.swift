//
//  Endpoint.swift
//  OMDbCaseProject
//
//  Created by Ertan Yağmur on 6.06.2025.
//

import Foundation

enum Endpoint {
  case search(title: String)

  var path: String {
    switch self {
    case .search:
      return ""
    }
  }

  var queryItems: [URLQueryItem] {
    switch self {
    case .search(let title):
      return [
        URLQueryItem(name: "apikey", value: APIConstants.apiKey),
        URLQueryItem(name: "s", value: title)
      ]
    }
  }

  var url: URL? {
    var components = URLComponents(string: APIConstants.baseURL)
    components?.path = path
    components?.queryItems = queryItems
    return components?.url
  }
}
