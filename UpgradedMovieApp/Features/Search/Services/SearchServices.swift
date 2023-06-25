//
//  SearchServices.swift
//  UpgradedMovieApp
//
//  Created by Caroline Chan on 25/06/23.
//

import Foundation

protocol SearchServicesProtocol: AnyObject {
    var networker: NetworkerProtocol { get }
    func search(endPoint: NetworkFactory) async throws -> SearchModel
}

final class SearchServices: SearchServicesProtocol {
    var networker: NetworkerProtocol
    
    init(networker: NetworkerProtocol = Networker()) {
        self.networker = networker
    }
    
    func search(endPoint: NetworkFactory) async throws -> SearchModel {
        return try await networker.taskAsync(type: SearchModel.self, endPoint: endPoint, isMultipart: false)
    }
}
