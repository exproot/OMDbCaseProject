//
//  MovieDTO.swift
//  OMDbCaseProject
//
//  Created by Ertan Yağmur on 5.06.2025.
//

import Foundation

struct MovieDTO: Decodable {
  let title: String
  let year: String
  let imdbID: String
  let poster: String?

  enum CodingKeys: String, CodingKey {
    case title = "Title"
    case year = "Year"
    case imdbID
    case poster = "Poster"
  }
}
