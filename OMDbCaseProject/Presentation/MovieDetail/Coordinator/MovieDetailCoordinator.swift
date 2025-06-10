//
//  MovieDetailCoordinator.swift
//  OMDbCaseProject
//
//  Created by Ertan Yağmur on 6.06.2025.
//

import UIKit

final class MovieDetailCoordinator {

  weak var navigationController: UINavigationController?

  private let imdbID: String

  init(navigationController: UINavigationController?, imdbID: String) {
    self.navigationController = navigationController
    self.imdbID = imdbID
  }

  func makeViewController() -> MovieDetailViewController {
    let networkService = DefaultNetworkService()
    let analyticsService = FirebaseAnalyticsService()
    let movieRepository = MovieRepositoryImpl(networkService: networkService)
    let fetchMovieDetailUseCase = DefaultFetchMovieDetailUseCase(repository: movieRepository)
    let movieDetailVM = MovieDetailViewModel(imdbID: imdbID, fetchMovieDetailUseCase: fetchMovieDetailUseCase, analyticsService: analyticsService)
    let movieDetailVC = MovieDetailViewController(viewModel: movieDetailVM)

    return movieDetailVC
  }

}
