//
//  FirebaseRemoteConfigService.swift
//  OMDbCaseProject
//
//  Created by Ertan Yağmur on 5.06.2025.
//

import FirebaseRemoteConfig
import Foundation

final class FirebaseRemoteConfigService: RemoteConfigService {

  private let remoteConfig: RemoteConfig

  init(remoteConfig: RemoteConfig = .remoteConfig()) {
    self.remoteConfig = remoteConfig
    let settings = RemoteConfigSettings()

    settings.minimumFetchInterval = 0
    self.remoteConfig.configSettings = settings
  }

  func fetchSplashTitle(completion: @escaping (String?) -> Void) {
    remoteConfig.fetchAndActivate { _, _ in
      let title = self.remoteConfig["splash_title"].stringValue
      completion(title)
    }
  }

}
