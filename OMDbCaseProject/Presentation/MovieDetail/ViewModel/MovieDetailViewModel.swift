//
//  MovieDetailViewModel.swift
//  OMDbCaseProject
//
//  Created by Ertan Yağmur on 6.06.2025.
//

import Foundation

enum MovieDetailViewState {
  case loading
  case success(MovieDetail)
  case failure(String)
}

final class MovieDetailViewModel {

  private let imdbID: String
  private let fetchMovieDetailUseCase: FetchMovieDetailUseCase

  var onStateChange: ((MovieDetailViewState) -> Void)?

  init(imdbID: String, fetchMovieDetailUseCase: FetchMovieDetailUseCase) {
    self.imdbID = imdbID
    self.fetchMovieDetailUseCase = fetchMovieDetailUseCase
    load()
  }

  func load() {

    DispatchQueue.main.async { [weak self] in
      self?.onStateChange?(.loading)
    }

    fetchMovieDetailUseCase.execute(imdbID: imdbID) { [weak self] result in
      guard let self = self else { return }

      DispatchQueue.main.async {
        switch result {
        case .success(let detail):
          self.onStateChange?(.success(detail))
        case .failure(let error):
          self.onStateChange?(.failure(error.localizedDescription))
        }
      }
    }
  }

}
