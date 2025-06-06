//
//  APIConstants.swift
//  OMDbCaseProject
//
//  Created by Ertan Yağmur on 6.06.2025.
//

import Foundation

enum APIConstants {
  static let baseURL = "https://www.omdbapi.com"

  static var apiKey: String {
    guard let key = Bundle.main.object(forInfoDictionaryKey: "OMDB_API_KEY") as? String else {
      fatalError("OMDB_API_KEY not found in Info.plist")
    }

    return key
  }
}
