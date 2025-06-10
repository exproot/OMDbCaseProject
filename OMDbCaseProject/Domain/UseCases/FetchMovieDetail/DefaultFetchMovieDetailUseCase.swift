//
//  DefaultFetchMovieDetailUseCase.swift
//  OMDbCaseProject
//
//  Created by Ertan Yağmur on 6.06.2025.
//

import Foundation

final class DefaultFetchMovieDetailUseCase: FetchMovieDetailUseCase {

  private let repository: MovieRepository

  init(repository: MovieRepository) {
    self.repository = repository
  }

  func execute(imdbID: String, completion: @escaping (Result<MovieDetail, Error>) -> Void) {
    repository.fetchMovieDetail(imdbID: imdbID, completion: completion)
  }

}
