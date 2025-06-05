//
//  SplashViewModel.swift
//  OMDbCaseProject
//
//  Created by Ertan Yağmur on 5.06.2025.
//

import Foundation

final class SplashViewModel {

  private let remoteConfigService: RemoteConfigService
  private let networkChecker: NetworkChecker

  var onTitleReady: ((String) -> Void)?
  var onProceed: (() -> Void)?
  var onNetworkError: (() -> Void)?

  init(remoteConfigService: RemoteConfigService, networkChecker: NetworkChecker) {
    self.remoteConfigService = remoteConfigService
    self.networkChecker = networkChecker
  }

  func load() {
    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) { [weak self] in
      self?.checkNetworkAndFetchConfig()
    }
  }

  private func checkNetworkAndFetchConfig() {
    guard networkChecker.isConnected else {
      onNetworkError?()
      return
    }

    fetchSplashTitle()
  }

  private func fetchSplashTitle() {
    remoteConfigService.fetchSplashTitle { [weak self] title in
      guard let self, let title else { return }

      self.onTitleReady?(title)
      self.proceedAfterDelay()
    }
  }

  private func proceedAfterDelay() {
    DispatchQueue.main.asyncAfter(deadline: .now() + 3) { [weak self] in
      guard let self = self else { return }

      self.onProceed?()
    }
  }

}
