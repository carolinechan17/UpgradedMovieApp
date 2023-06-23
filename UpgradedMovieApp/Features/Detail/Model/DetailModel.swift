//
//  DetailModel.swift
//  UpgradedMovieApp
//
//  Created by Caroline Chan on 23/06/23.
//

import Foundation

struct DetailModel: Codable, Hashable {
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
    
    init(id: String = "",
         title: String = "",
         originalTitle: String = "",
         fullTitle: String = "",
         type: String = "",
         year: String = "",
         image: String = "",
         releaseDate: String = "",
         runtimeMins: String = "",
         runtimeStr: String = "",
         plot: String = "",
         plotLocal: String = "",
         plotLocalIsRTL: Bool = false,
         awards: String = "",
         directors: String = "",
         directorList: [CompanyListElement] = [],
         writers: String = "",
         writerList: [CompanyListElement] = [],
         stars: String = "",
         starList: [CompanyListElement] = [],
         actorList: [ActorList] = [],
         fullCast: JSONNull? = nil,
         genres: String = "",
         genreList: [CountryListElement] = [],
         companies: String = "",
         companyList: [CompanyListElement] = [],
         countries: String = "",
         countryList: [CountryListElement] = [],
         languages: String = "",
         languageList: [CountryListElement] = [],
         contentRating: String = "",
         imDBRating: String = "",
         imDBRatingVotes: String = "",
         metacriticRating: String = "",
         ratings: JSONNull? = nil,
         wikipedia: JSONNull? = nil,
         posters: JSONNull? = nil,
         images: JSONNull? = nil,
         trailer: JSONNull? = nil,
         boxOffice: BoxOffice = BoxOffice(),
         tagline: JSONNull? = nil,
         keywords: String = "",
         keywordList: [String] = [],
         similars: [Similar] = [],
         tvSeriesInfo: JSONNull? = nil,
         tvEpisodeInfo: JSONNull? = nil,
         errorMessage: String = "") {
        self.id = id
        self.title = title
        self.originalTitle = originalTitle
        self.fullTitle = fullTitle
        self.type = type
        self.year = year
        self.image = image
        self.releaseDate = releaseDate
        self.runtimeMins = runtimeMins
        self.runtimeStr = runtimeStr
        self.plot = plot
        self.plotLocal = plotLocal
        self.plotLocalIsRTL = plotLocalIsRTL
        self.awards = awards
        self.directors = directors
        self.directorList = directorList
        self.writers = writers
        self.writerList = writerList
        self.stars = stars
        self.starList = starList
        self.actorList = actorList
        self.fullCast = fullCast
        self.genres = genres
        self.genreList = genreList
        self.companies = companies
        self.companyList = companyList
        self.countries = countries
        self.countryList = countryList
        self.languages = languages
        self.languageList = languageList
        self.contentRating = contentRating
        self.imDBRating = imDBRating
        self.imDBRatingVotes = imDBRatingVotes
        self.metacriticRating = metacriticRating
        self.ratings = ratings
        self.wikipedia = wikipedia
        self.posters = posters
        self.images = images
        self.trailer = trailer
        self.boxOffice = boxOffice
        self.tagline = tagline
        self.keywords = keywords
        self.keywordList = keywordList
        self.similars = similars
        self.tvSeriesInfo = tvSeriesInfo
        self.tvEpisodeInfo = tvEpisodeInfo
        self.errorMessage = errorMessage
    }
}

// MARK: - ActorList
struct ActorList: Codable, Hashable {
    let id: String
    let image: String
    let name, asCharacter: String
}

// MARK: - BoxOffice
struct BoxOffice: Codable, Hashable {
    let budget, openingWeekendUSA, grossUSA, cumulativeWorldwideGross: String
    
    init(budget: String = "", openingWeekendUSA: String = "", grossUSA: String = "", cumulativeWorldwideGross: String = "") {
        self.budget = budget
        self.openingWeekendUSA = openingWeekendUSA
        self.grossUSA = grossUSA
        self.cumulativeWorldwideGross = cumulativeWorldwideGross
    }
}

// MARK: - CompanyListElement
struct CompanyListElement: Codable, Hashable {
    let id, name: String
}

// MARK: - CountryListElement
struct CountryListElement: Codable, Hashable {
    let key, value: String
}

// MARK: - Similar
struct Similar: Codable, Hashable {
    let id, title: String
    let image: String
    let imDBRating: String

    enum CodingKeys: String, CodingKey {
        case id, title, image
        case imDBRating = "imDbRating"
    }
}
