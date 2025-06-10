//
//  FetchMovieDetailUseCase.swift
//  OMDbCaseProject
//
//  Created by Ertan Yağmur on 6.06.2025.
//

import Foundation

protocol FetchMovieDetailUseCase {
  func execute(imdbID: String, completion: @escaping (Result<MovieDetail, Error>) -> Void)
}
