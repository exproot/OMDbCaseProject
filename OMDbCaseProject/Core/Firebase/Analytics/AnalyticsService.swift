//
//  AnalyticsService.swift
//  OMDbCaseProject
//
//  Created by Ertan Yağmur on 10.06.2025.
//

import Foundation

protocol AnalyticsService {
  func logEvent(_ name: String, parameters: [String: Any]?)
}
