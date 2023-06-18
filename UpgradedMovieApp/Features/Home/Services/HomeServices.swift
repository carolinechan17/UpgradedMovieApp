//
//  HomeServices.swift
//  UpgradedMovieApp
//
//  Created by Caroline Chan on 10/06/23.
//

import Foundation

protocol HomeServicesProtocol: AnyObject {
    var networker: NetworkerProtocol { get }
    func getTopMovies(endPoint: NetworkFactory) async throws -> TopMovieModel
    func getTopTVShows(endPoint: NetworkFactory) async throws -> TopTVShowsModel
    func getPopularMovies(endPoint: NetworkFactory) async throws -> PopularMoviesModel
}

final class HomeServices: HomeServicesProtocol {
    var networker: NetworkerProtocol
    
    init(networker: NetworkerProtocol = Networker()) {
        self.networker = networker
    }
    
    func getTopMovies(endPoint: NetworkFactory) async throws -> TopMovieModel {
        return try await networker.taskAsync(type: TopMovieModel.self, endPoint: endPoint, isMultipart: false)
    }
    
    func getTopTVShows(endPoint: NetworkFactory) async throws -> TopTVShowsModel {
        return try await networker.taskAsync(type: TopTVShowsModel.self, endPoint: endPoint, isMultipart: false)
    }
    
    func getPopularMovies(endPoint: NetworkFactory) async throws -> PopularMoviesModel {
        return try await networker.taskAsync(type: PopularMoviesModel.self, endPoint: endPoint, isMultipart: false)
    }
}
