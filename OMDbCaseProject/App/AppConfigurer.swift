//
//  AppConfigurer.swift
//  OMDbCaseProject
//
//  Created by Ertan Yağmur on 12.06.2025.
//

import DependencyContainer
import Foundation

enum AppConfigurer {

  private static var didConfigureDependencies = false

  static func configureDependencies() {
    guard didConfigureDependencies == false else {
      assertionFailure("")
      return
    }

    didConfigureDependencies = true

    DC.shared.register(type: .singleInstance(DefaultNetworkService()), for: NetworkService.self)
    DC.shared.register(type: .singleInstance(FirebaseRemoteConfigService()), for: RemoteConfigService.self)
    DC.shared.register(type: .singleInstance(DefaultNetworkReachabilityService()), for: NetworkReachabilityService.self)
    DC.shared.register(type: .singleInstance(FirebaseAnalyticsService()), for: AnalyticsService.self)

    DC.shared.register(type: .closureBased({
      let networkService = DC.shared.resolve(type: .singleInstance, for: NetworkService.self)

      return MovieRepositoryImpl(networkService: networkService)
    }), for: MovieRepository.self)


    DC.shared.register(type: .closureBased({
      let repository = DC.shared.resolve(type: .closureBased, for: MovieRepository.self)

      return DefaultFetchMoviesUseCase(repository: repository)
    }), for: FetchMoviesUseCase.self)

    DC.shared.register(type: .closureBased({
      let repository = DC.shared.resolve(type: .closureBased, for: MovieRepository.self)

      return DefaultFetchMovieDetailUseCase(repository: repository)
    }), for: FetchMovieDetailUseCase.self)

  }

}
