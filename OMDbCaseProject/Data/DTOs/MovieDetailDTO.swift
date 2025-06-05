//
//  MovieDetailDTO.swift
//  OMDbCaseProject
//
//  Created by Ertan Yağmur on 5.06.2025.
//

import Foundation

struct MovieDetailDTO: Decodable {
  let title: String
  let year: String
  let runtime: String
  let genre: String
  let director: String
  let plot: String
  let poster: String?
  let imdbRating: String
  let imdbID: String

  enum CodingKeys: String, CodingKey {
    case title = "Title"
    case year = "Year"
    case runtime = "Runtime"
    case genre =  "Genre"
    case director = "Director"
    case plot = "Plot"
    case poster = "Poster"
    case imdbRating
    case imdbID
  }
}
