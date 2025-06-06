//
//  DefaultNetworkReachabilityService.swift
//  OMDbCaseProject
//
//  Created by Ertan Yağmur on 5.06.2025.
//

import Foundation
import Network

final class DefaultNetworkReachabilityService: NetworkReachabilityService {

  private let monitor: NWPathMonitor
  private let queue = DispatchQueue(label: "NetworkReachabilityMonitor")
  private var status: NWPath.Status = .requiresConnection

  init() {
    self.monitor = NWPathMonitor()
    self.monitor.pathUpdateHandler = { [weak self] path in
      self?.status = path.status
    }
    self.monitor.start(queue: queue)
  }

  var isConnected: Bool {
    return status == .satisfied
  }

}
