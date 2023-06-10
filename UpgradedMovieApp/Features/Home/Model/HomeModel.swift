//
//  HomeModel.swift
//  UpgradedMovieApp
//
//  Created by Caroline Chan on 10/06/23.
//

import Foundation

struct TopMovieModel: Codable {
    let items: [TopMovieElement]
    let errorMessage: String

    init(items: [TopMovieElement] = [], errorMessage: String = "") {
        self.items = items
        self.errorMessage = errorMessage
    }
}

struct TopMovieElement: Codable {
    let id, rank, rankUpDown, title: String
    let fullTitle, year: String
    let image: String
    let crew, imDBRating, imDBRatingCount: String

    enum CodingKeys: String, CodingKey {
        case id, rank, rankUpDown, title, fullTitle, year, image, crew
        case imDBRating = "imDbRating"
        case imDBRatingCount = "imDbRatingCount"
    }
}
