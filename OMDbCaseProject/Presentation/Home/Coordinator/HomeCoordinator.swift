//
//  HomeCoordinator.swift
//  OMDbCaseProject
//
//  Created by Ertan Yağmur on 6.06.2025.
//

import UIKit

final class HomeCoordinator {

  weak var navigationController: UINavigationController?

  init(navigationController: UINavigationController?) {
    self.navigationController = navigationController
  }

  func makeViewController() -> HomeViewController {
    let networkService = DefaultNetworkService()
    let movieRepository = MovieRepositoryImpl(networkService: networkService)
    let fetchMoviesUseCase = DefaultFetchMoviesUseCase(repository: movieRepository)
    let homeVM = HomeViewModel(fetchMoviesUseCase: fetchMoviesUseCase, onMovieSelected: showMovieDetail)

    let homeVC = HomeViewController(viewModel: homeVM)
    return homeVC
  }

  func showMovieDetail(imdbID: String) {
    let detailCoordinator = MovieDetailCoordinator(navigationController: navigationController, imdbID: imdbID)
    let detailVC = detailCoordinator.makeViewController()

    navigationController?.pushViewController(detailVC, animated: true)
  }

}
