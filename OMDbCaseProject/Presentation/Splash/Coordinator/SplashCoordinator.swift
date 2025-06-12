//
//  SplashCoordinator.swift
//  OMDbCaseProject
//
//  Created by Ertan Yağmur on 5.06.2025.
//

import DependencyContainer
import UIKit

final class SplashCoordinator {

  weak var navigationController: UINavigationController?

  init(navigationController: UINavigationController?) {
    self.navigationController = navigationController
  }

  func makeViewController() -> SplashViewController {
    let remoteConfigService = DC.shared.resolve(type: .singleInstance, for: RemoteConfigService.self)
    let networkReachability = DC.shared.resolve(type: .singleInstance, for: NetworkReachabilityService.self)
    let splashVM = SplashViewModel(remoteConfigService: remoteConfigService, networkChecker: networkReachability)

    splashVM.onProceed = showHome

    return SplashViewController(viewModel: splashVM)
  }

  private func showHome() {
    let homeCoordinator = HomeCoordinator(navigationController: navigationController)
    let homeVC = homeCoordinator.makeViewController()

    navigationController?.setViewControllers([homeVC], animated: true)
  }

}
