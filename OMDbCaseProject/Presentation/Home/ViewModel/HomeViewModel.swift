//
//  HomeViewModel.swift
//  OMDbCaseProject
//
//  Created by Ertan Yağmur on 6.06.2025.
//

import Foundation

enum HomeViewState {
  case idle
  case loading
  case success
  case failure(String)
}

final class HomeViewModel {

  private let fetchMoviesUseCase: FetchMoviesUseCase
  private(set) var movies: [Movie] = []

  var onStateChange: ((HomeViewState) -> Void)?
  var onMovieSelected: ((String) -> Void)?

  init(
    fetchMoviesUseCase: FetchMoviesUseCase,
    onMovieSelected: (@escaping (String) -> Void)
  ) {
    self.fetchMoviesUseCase = fetchMoviesUseCase
    self.onMovieSelected = onMovieSelected
  }

  func searchMovies(query: String) {
    guard !query.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {
      movies = []
      onStateChange?(.idle)
      return
    }

    onStateChange?(.loading)

    fetchMoviesUseCase.execute(query: query) { [weak self] result in
      DispatchQueue.main.async {
        switch result {
        case .success(let movies):
          self?.movies = movies

          if movies.isEmpty {
            self?.onStateChange?(.failure("Sonuç bulunamadı."))
          } else {
            self?.onStateChange?(.success)
          }

        case .failure(let error):
          self?.movies = []
          self?.onStateChange?(.failure(error.localizedDescription))
        }
      }
    }
  }

  func movie(at index: Int) -> Movie {
    return movies[index]
  }

  var numberOfMovies: Int {
    return movies.count
  }

}
