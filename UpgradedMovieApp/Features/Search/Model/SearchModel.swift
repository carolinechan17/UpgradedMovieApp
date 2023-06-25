//
//  SearchModel.swift
//  UpgradedMovieApp
//
//  Created by Caroline Chan on 25/06/23.
//

import Foundation

struct SearchModel: Codable, Hashable {
    let searchType: SearchTypeEnum
    let expression: String
    let results: [Result]
    let errorMessage: String
    
    init(searchType: SearchTypeEnum = .title, expression: String = "", results: [Result] = [], errorMessage: String = "") {
        self.searchType = searchType
        self.expression = expression
        self.results = results
        self.errorMessage = errorMessage
    }
}

struct Result: Codable, Hashable {
    let id: String
    let resultType: SearchTypeEnum
    let image: String
    let title, description: String
    
    init(id: String = "", resultType: SearchTypeEnum = .title, image: String = "", title: String = "", description: String = "") {
        self.id = id
        self.resultType = resultType
        self.image = image
        self.title = title
        self.description = description
    }
}

enum SearchTypeEnum: String, Codable, Hashable {
    case title = "Title"
}
