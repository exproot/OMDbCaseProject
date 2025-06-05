//
//  SearchResponseDTO.swift
//  OMDbCaseProject
//
//  Created by Ertan Yağmur on 5.06.2025.
//

import Foundation

struct SearchResponseDTO: Decodable {
  let search: [MovieDTO]?
  let totalResults: String?
  let response: String
  let error: String?

  enum CodingKeys: String, CodingKey {
    case search = "Search"
    case totalResults
    case response = "Response"
    case error = "Error"
  }
}
