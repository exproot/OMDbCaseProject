//
//  DefaultNetworkService.swift
//  OMDbCaseProject
//
//  Created by Ertan Yağmur on 5.06.2025.
//

import Foundation

final class DefaultNetworkService: NetworkService {

  private let session: URLSession

  init(session: URLSession = .shared) {
    self.session = session
  }

  // TODO: Better Error Handling
  func request<T: Decodable>(endpoint: URL, completion: @escaping (Result<T, Error>) -> Void) {
    let task = session.dataTask(with: endpoint) { data, response, error in
      if let error {
        return completion(.failure(error))
      }

      guard let data else {
        return completion(.failure(URLError(.badServerResponse)))
      }

      do {
        let decoded = try JSONDecoder().decode(T.self, from: data)
        completion(.success(decoded))
      } catch {
        completion(.failure(error))
      }
    }

    task.resume()
  }

}
