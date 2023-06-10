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
}

final class HomeServices: HomeServicesProtocol {
    var networker: NetworkerProtocol
    
    init(networker: NetworkerProtocol = Networker()) {
        self.networker = networker
    }
    
    func getTopMovies(endPoint: NetworkFactory) async throws -> TopMovieModel {
        return try await networker.taskAsync(type: TopMovieModel.self, endPoint: endPoint, isMultipart: false)
    }
}