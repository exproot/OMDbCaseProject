//
//  MovieRepository.swift
//  OMDbCaseProject
//
//  Created by Ertan Yağmur on 5.06.2025.
//

import Foundation

protocol MovieRepository {
  func searchMovies(by title: String, completion: @escaping (Result<[Movie], Error>) -> Void)
  func fetchMovieDetail(imdbID: String, completion: @escaping (Result<MovieDetail, Error>) -> Void)
}
