//
//  MovieRepositoryImpl.swift
//  OMDbCaseProject
//
//  Created by Ertan Yağmur on 5.06.2025.
//

import Foundation

final class MovieRepositoryImpl {

  final class MovieRepositoryImpl: MovieRepository {
    func searchMovies(by title: String, completion: @escaping (Result<[Movie], Error>) -> Void) {
      // TODO: Implement OMDb API call
    }

    func fetchMovieDetail(imdbID: String, completion: @escaping (Result<MovieDetail, Error>) -> Void) {
      // TODO: Implement OMDb API call
    }
  }
  
}
