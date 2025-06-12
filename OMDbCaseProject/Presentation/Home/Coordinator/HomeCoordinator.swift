//
//  HomeCoordinator.swift
//  OMDbCaseProject
//
//  Created by Ertan Yağmur on 6.06.2025.
//

import DependencyContainer
import UIKit

final class HomeCoordinator {

  weak var navigationController: UINavigationController?

  init(navigationController: UINavigationController?) {
    self.navigationController = navigationController
  }

  func makeViewController() -> HomeViewController {
    let fetchMoviesUseCase = DC.shared.resolve(type: .closureBased, for: FetchMoviesUseCase.self)
    let homeVM = HomeViewModel(fetchMoviesUseCase: fetchMoviesUseCase, onMovieSelected: showMovieDetail)

    return HomeViewController(viewModel: homeVM)
  }

  func showMovieDetail(imdbID: String) {
    let detailCoordinator = MovieDetailCoordinator(navigationController: navigationController, imdbID: imdbID)
    let detailVC = detailCoordinator.makeViewController()

    navigationController?.pushViewController(detailVC, animated: true)
  }

}
