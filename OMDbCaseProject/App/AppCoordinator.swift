//
//  AppCoordinator.swift
//  OMDbCaseProject
//
//  Created by Ertan Yağmur on 5.06.2025.
//

import UIKit

final class AppCoordinator {

  var navigationController: UINavigationController

  init(navigationController: UINavigationController) {
    self.navigationController = navigationController
  }

  func start() {
    showSplash()
  }

  private func showSplash() {
    let splashCoordinator = SplashCoordinator(navigationController: navigationController)
    let splashVC = splashCoordinator.makeViewController()

    navigationController.setViewControllers([splashVC], animated: false)
  }
}
