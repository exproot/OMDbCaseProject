//
//  RemoteConfigService.swift
//  OMDbCaseProject
//
//  Created by Ertan Yağmur on 5.06.2025.
//

import Foundation

protocol RemoteConfigService {
  func fetchSplashTitle(completion: @escaping (String?) -> Void)
}
