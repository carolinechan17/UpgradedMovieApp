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
