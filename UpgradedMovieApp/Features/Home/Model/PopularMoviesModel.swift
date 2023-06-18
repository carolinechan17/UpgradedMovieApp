//
//  PopularMoviesModel.swift
//  UpgradedMovieApp
//
//  Created by Caroline Chan on 18/06/23.
//

import Foundation

struct PopularMoviesModel: Codable, Hashable {
    let items: [PopularMoviesElement]
    let errorMessage: String
    
    init(items: [PopularMoviesElement] = [], errorMessage: String = "") {
        self.items = items
        self.errorMessage = errorMessage
    }
}

struct PopularMoviesElement: Codable, Hashable {
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
