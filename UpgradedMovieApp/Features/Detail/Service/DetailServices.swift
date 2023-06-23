//
//  DetailServices.swift
//  UpgradedMovieApp
//
//  Created by Caroline Chan on 23/06/23.
//

import Foundation

protocol DetailServicesProtocol: AnyObject {
    var networker: NetworkerProtocol { get }
    func getDetail(endPoint: NetworkFactory) async throws -> DetailModel
}

final class DetailServices: DetailServicesProtocol {
    var networker: NetworkerProtocol
    
    init(networker: NetworkerProtocol = Networker()) {
        self.networker = networker
    }
    
    func getDetail(endPoint: NetworkFactory) async throws -> DetailModel {
        return try await networker.taskAsync(type: DetailModel.self, endPoint: endPoint, isMultipart: false)
    }
}
