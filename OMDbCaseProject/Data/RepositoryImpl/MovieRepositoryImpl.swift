//
//  MovieRepositoryImpl.swift
//  OMDbCaseProject
//
//  Created by Ertan Yağmur on 5.06.2025.
//

import Foundation

final class MovieRepositoryImpl: MovieRepository {

  private let networkService: NetworkService

  init(networkService: NetworkService) {
    self.networkService = networkService
  }

  func searchMovies(by title: String, completion: @escaping (Result<[Movie], Error>) -> Void) {
    guard let url = Endpoint.search(title: title).url else {
      completion(.failure(URLError(.badURL)))
      return
    }

    networkService.request(endpoint: url) { (result: Result<SearchResponseDTO, Error>) in
      switch result {
      case .success(let dto):
        let movies = dto.search?.map { $0.toDomain() } ?? []
        completion(.success(movies))

      case .failure(let error):
        completion(.failure(error))
      }
    }
  }

  func fetchMovieDetail(imdbID: String, completion: @escaping (Result<MovieDetail, Error>) -> Void) {
    guard let url = Endpoint.detail(imdbID: imdbID).url else {
      completion(.failure(URLError(.badURL)))
      return
    }

    networkService.request(endpoint: url) { (result: Result<MovieDetailDTO, Error>) in
      switch result {
      case .success(let dto):
        let detail = dto.toDomain()
        completion(.success(detail))

      case .failure(let error):
        completion(.failure(error))
      }
    }
  }

}
