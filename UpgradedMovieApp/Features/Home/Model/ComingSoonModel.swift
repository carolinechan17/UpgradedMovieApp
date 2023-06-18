//
//  ComingSoonModel.swift
//  UpgradedMovieApp
//
//  Created by Caroline Chan on 18/06/23.
//

import Foundation

struct ComingSoonModel: Codable, Hashable {
    let items: [ComingSoonElement]
    let errorMessage: String
    
    init(items: [ComingSoonElement] = [], errorMessage: String = "") {
        self.items = items
        self.errorMessage = errorMessage
    }
}

struct ComingSoonElement: Codable, Hashable {
    let id, title, fullTitle, year: String
    let releaseState: String
    let image: String
    let runtimeMins, runtimeStr, plot, contentRating: JSONNull?
    let imDBRating, imDBRatingCount, metacriticRating: JSONNull?
    let genres: String
    let genreList: [GenreList]
    let directors: JSONNull?
    let directorList: [String]
    let stars: String
    let starList: [StarList]

    enum CodingKeys: String, CodingKey {
        case id, title, fullTitle, year, releaseState, image, runtimeMins, runtimeStr, plot, contentRating
        case imDBRating = "imDbRating"
        case imDBRatingCount = "imDbRatingCount"
        case metacriticRating, genres, genreList, directors, directorList, stars, starList
    }
}

struct StarList: Codable, Hashable {
    let id: JSONNull?
    let name: String
}
