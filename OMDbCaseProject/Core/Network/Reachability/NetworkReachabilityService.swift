//
//  NetworkReachabilityService.swift
//  OMDbCaseProject
//
//  Created by Ertan Yağmur on 5.06.2025.
//

import Foundation

protocol NetworkReachabilityService {
  var isConnected: Bool { get }
}
