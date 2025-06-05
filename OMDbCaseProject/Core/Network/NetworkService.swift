//
//  NetworkService.swift
//  OMDbCaseProject
//
//  Created by Ertan Yağmur on 5.06.2025.
//

import Foundation

protocol NetworkService {
  func request<T: Decodable>(endpoint: URL, completion: @escaping (Result<T, Error>) -> Void)
}
