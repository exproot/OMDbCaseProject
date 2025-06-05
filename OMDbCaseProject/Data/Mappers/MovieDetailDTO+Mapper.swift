//
//  MovieDetailDTO+Mapper.swift
//  OMDbCaseProject
//
//  Created by Ertan Yağmur on 5.06.2025.
//

import Foundation

extension MovieDetailDTO {
  func toDomain() -> MovieDetail {
    return MovieDetail(
      id: imdbID,
      title: title,
      year: year,
      runtime: runtime,
      genre: genre,
      director: director,
      plot: plot,
      posterURL: URL(string: poster ?? ""),
      imdbRating: imdbRating
    )
  }
}
