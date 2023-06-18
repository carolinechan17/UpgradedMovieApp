//
//  InTheaterModel.swift
//  UpgradedMovieApp
//
//  Created by Caroline Chan on 18/06/23.
//

import Foundation

struct InTheaterModel: Codable, Hashable {
    let items: [InTheaterElement]
    let errorMessage: String
    
    init(items: [InTheaterElement] = [], errorMessage: String = "") {
        self.items = items
        self.errorMessage = errorMessage
    }
}

struct InTheaterElement: Codable, Hashable {
    let id, title, fullTitle, year: String
    let releaseState: String
    let image: String
    let runtimeMins, runtimeStr, plot, contentRating: String
    let imDBRating, imDBRatingCount, metacriticRating, genres: String
    let genreList: [GenreList]
    let directors: String
    let directorList: [RList]
    let stars: String
    let starList: [RList]
    
    enum CodingKeys: String, CodingKey {
        case id, title, fullTitle, year, releaseState, image, runtimeMins, runtimeStr, plot, contentRating
        case imDBRating = "imDbRating"
        case imDBRatingCount = "imDbRatingCount"
        case metacriticRating, genres, genreList, directors, directorList, stars, starList
    }
}

struct RList: Codable, Hashable {
    let id, name: String
}

struct GenreList: Codable, Hashable {
    let key, value: String
}
