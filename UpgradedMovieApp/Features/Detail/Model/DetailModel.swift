//
//  DetailModel.swift
//  UpgradedMovieApp
//
//  Created by Caroline Chan on 23/06/23.
//

import Foundation

struct DetailModel: Codable {
    let id, title, originalTitle, fullTitle: String
    let type, year: String
    let image: String
    let releaseDate, runtimeMins, runtimeStr, plot: String
    let plotLocal: String
    let plotLocalIsRTL: Bool
    let awards, directors: String
    let directorList: [CompanyListElement]
    let writers: String
    let writerList: [CompanyListElement]
    let stars: String
    let starList: [CompanyListElement]
    let actorList: [ActorList]
    let fullCast: JSONNull?
    let genres: String
    let genreList: [CountryListElement]
    let companies: String
    let companyList: [CompanyListElement]
    let countries: String
    let countryList: [CountryListElement]
    let languages: String
    let languageList: [CountryListElement]
    let contentRating, imDBRating, imDBRatingVotes, metacriticRating: String
    let ratings, wikipedia, posters, images: JSONNull?
    let trailer: JSONNull?
    let boxOffice: BoxOffice
    let tagline: JSONNull?
    let keywords: String
    let keywordList: [String]
    let similars: [Similar]
    let tvSeriesInfo, tvEpisodeInfo: JSONNull?
    let errorMessage: String

    enum CodingKeys: String, CodingKey {
        case id, title, originalTitle, fullTitle, type, year, image, releaseDate, runtimeMins, runtimeStr, plot, plotLocal
        case plotLocalIsRTL = "plotLocalIsRtl"
        case awards, directors, directorList, writers, writerList, stars, starList, actorList, fullCast, genres, genreList, companies, companyList, countries, countryList, languages, languageList, contentRating
        case imDBRating = "imDbRating"
        case imDBRatingVotes = "imDbRatingVotes"
        case metacriticRating, ratings, wikipedia, posters, images, trailer, boxOffice, tagline, keywords, keywordList, similars, tvSeriesInfo, tvEpisodeInfo, errorMessage
    }
}

// MARK: - ActorList
struct ActorList: Codable {
    let id: String
    let image: String
    let name, asCharacter: String
}

// MARK: - BoxOffice
struct BoxOffice: Codable {
    let budget, openingWeekendUSA, grossUSA, cumulativeWorldwideGross: String
}

// MARK: - CompanyListElement
struct CompanyListElement: Codable {
    let id, name: String
}

// MARK: - CountryListElement
struct CountryListElement: Codable {
    let key, value: String
}

// MARK: - Similar
struct Similar: Codable {
    let id, title: String
    let image: String
    let imDBRating: String

    enum CodingKeys: String, CodingKey {
        case id, title, image
        case imDBRating = "imDbRating"
    }
}
