//
//  HomeModel.swift
//  UpgradedMovieApp
//
//  Created by Caroline Chan on 10/06/23.
//

import Foundation

struct TopMovieModel: Codable, Hashable {
    let items: [TopMovieElement]
    let errorMessage: String

    init(items: [TopMovieElement] = [], errorMessage: String = "") {
        self.items = items
        self.errorMessage = errorMessage
    }
}

struct TopMovieElement: Codable, Hashable {
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

struct PopularTVShowsModel: Codable, Hashable {
    let items: [PopularTVShowsElement]
    let errorMessage: String
    
    init(items: [PopularTVShowsElement] = [], errorMessage: String = "") {
        self.items = items
        self.errorMessage = errorMessage
    }
}

struct PopularTVShowsElement: Codable, Hashable {
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

