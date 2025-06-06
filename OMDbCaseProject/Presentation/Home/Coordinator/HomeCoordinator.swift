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

  func makeViewController() -> UIViewController {
    let networkService = DefaultNetworkService()
    let movieRepository = MovieRepositoryImpl(networkService: networkService)
    let fetchMoviesUseCase = DefaultFetchMoviesUseCase(repository: movieRepository)
    let homeVM = HomeViewModel(fetchMoviesUseCase: fetchMoviesUseCase)

    let homeVC = HomeViewController(viewModel: homeVM)
    return homeVC
  }

}
