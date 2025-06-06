//
//  DefaultFetchMoviesUseCase.swift
//  OMDbCaseProject
//
//  Created by Ertan Yağmur on 6.06.2025.
//


import Foundation

final class DefaultFetchMoviesUseCase: FetchMoviesUseCase {

  private let repository: MovieRepository

  init(repository: MovieRepository) {
    self.repository = repository
  }

  func execute(query: String, completion: @escaping (Result<[Movie], Error>) -> Void) {
    repository.searchMovies(by: query, completion: completion)
  }

}