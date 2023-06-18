//
//  TopTVShowsModel.swift
//  UpgradedMovieApp
//
//  Created by Caroline Chan on 18/06/23.
//

import Foundation

struct TopTVShowsModel: Codable, Hashable {
    let items: [TopTVShowsElement]
    let errorMessage: String
    
    init(items: [TopTVShowsElement] = [], errorMessage: String = "") {
        self.items = items
        self.errorMessage = errorMessage
    }
}

struct TopTVShowsElement: Codable, Hashable {
    let id, rank, title, fullTitle: String
    let year: String
    let image: String
    let crew, imDBRating, imDBRatingCount: String
    
    enum CodingKeys: String, CodingKey {
        case id, rank, title, fullTitle, year, image, crew
        case imDBRating = "imDbRating"
        case imDBRatingCount = "imDbRatingCount"
    }
}
