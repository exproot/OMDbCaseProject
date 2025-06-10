//
//  SplashCoordinator.swift
//  OMDbCaseProject
//
//  Created by Ertan Yağmur on 5.06.2025.
//

import UIKit

final class SplashCoordinator {

  weak var navigationController: UINavigationController?

  init(navigationController: UINavigationController?) {
    self.navigationController = navigationController
  }

  func makeViewController() -> SplashViewController {
    let remoteConfigService = FirebaseRemoteConfigService()
    let networkChecker = DefaultNetworkReachabilityService()
    let splashVM = SplashViewModel(remoteConfigService: remoteConfigService, networkChecker: networkChecker)
    let splashVC = SplashViewController(viewModel: splashVM)

    splashVM.onProceed = showHome

    return splashVC
  }

  private func showHome() {
    let homeCoordinator = HomeCoordinator(navigationController: navigationController)
    let homeVC = homeCoordinator.makeViewController()

    navigationController?.setViewControllers([homeVC], animated: true)
  }

}
