//
//  FirebaseAnalyticsService.swift
//  OMDbCaseProject
//
//  Created by Ertan Yağmur on 12.06.2025.
//


import FirebaseAnalytics

final class FirebaseAnalyticsService: AnalyticsService {

  func logEvent(_ name: String, parameters: [String : Any]?) {
    Analytics.logEvent(name, parameters: parameters)
  }

}
