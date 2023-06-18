//
//  BoxOfficeModel.swift
//  UpgradedMovieApp
//
//  Created by Caroline Chan on 18/06/23.
//

import Foundation

struct BoxOfficeModel: Codable, Hashable {
    let items: [BoxOfficeElement]
    let errorMessage: String
    
    init(items: [BoxOfficeElement] = [], errorMessage: String = "") {
        self.items = items
        self.errorMessage = errorMessage
    }
}

// MARK: - Item
struct BoxOfficeElement: Codable, Hashable {
    let id, rank, title: String
    let image: String
    let weekend, gross, weeks: String
}
