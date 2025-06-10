//
//  Endpoint.swift
//  OMDbCaseProject
//
//  Created by Ertan Yağmur on 6.06.2025.
//

import Foundation

enum Endpoint {
  case search(title: String)
  case detail(imdbID: String)

  var path: String {
    switch self {
    case .search, .detail:
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

    case .detail(let imdbID):
      return [
        URLQueryItem(name: "apikey", value: APIConstants.apiKey),
        URLQueryItem(name: "i", value: imdbID)
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
