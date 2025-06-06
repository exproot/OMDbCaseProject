//
//  DefaultNetworkService.swift
//  OMDbCaseProject
//
//  Created by Ertan Yağmur on 5.06.2025.
//

import Alamofire
import Foundation

final class DefaultNetworkService: NetworkService {

  func request<T: Decodable>(endpoint: URL, completion: @escaping (Result<T, Error>) -> Void) {
    AF.request(endpoint)
      .validate()
      .responseDecodable(of: T.self) { response in
        switch response.result {
        case .success(let decodedData):
          completion(.success(decodedData))
        case .failure(let error):
          completion(.failure(error))
        }
      }
  }

}
