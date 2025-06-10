//
//  FetchMoviesUseCase.swift
//  OMDbCaseProject
//
//  Created by Ertan Yağmur on 6.06.2025.
//

import Foundation

protocol FetchMoviesUseCase {
  func execute(query: String, completion: @escaping (Result<[Movie], Error>) -> Void)
}


