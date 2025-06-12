//
//  MovieDetailCoordinator.swift
//  OMDbCaseProject
//
//  Created by Ertan Yağmur on 6.06.2025.
//

import DependencyContainer
import UIKit

final class MovieDetailCoordinator {

  weak var navigationController: UINavigationController?

  private let imdbID: String

  init(navigationController: UINavigationController?, imdbID: String) {
    self.navigationController = navigationController
    self.imdbID = imdbID
  }

  func makeViewController() -> MovieDetailViewController {
    let fetchMovieDetailUseCase = DC.shared.resolve(type: .closureBased, for: FetchMovieDetailUseCase.self)
    let movieDetailVM = MovieDetailViewModel(imdbID: imdbID, fetchMovieDetailUseCase: fetchMovieDetailUseCase)

    return MovieDetailViewController(viewModel: movieDetailVM)
  }

}
