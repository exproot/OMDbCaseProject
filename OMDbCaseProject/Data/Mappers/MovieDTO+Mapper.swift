//
//  MovieDTO+Mapper.swift
//  OMDbCaseProject
//
//  Created by Ertan Yağmur on 5.06.2025.
//

import Foundation

extension MovieDTO {
  func toDomain() -> Movie {
    return Movie(
      id: imdbID,
      title: title,
      year: year,
      posterURL: URL(string: poster ?? "")
    )
  }
}
