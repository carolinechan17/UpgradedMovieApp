//
//  SearchViewModel.swift
//  UpgradedMovieApp
//
//  Created by Caroline Chan on 25/06/23.
//

import Foundation
import SwiftUI

@MainActor
class SearchViewModel: ObservableObject {
    @Published var result: SearchModel = SearchModel()
    @Published var isLoading: Bool = false
    @Published var isNewlyOpen: Bool = true
    
    private var searchServices: SearchServicesProtocol
    
    init(searchServices: SearchServicesProtocol = SearchServices()) {
        self.searchServices = searchServices
    }
    
    func searchByQuery(query: String) async {
        isNewlyOpen = false
        isLoading = true
        guard let data = try? await searchServices.search(endPoint: .search(query: query)) else { return }
        result = data
        isLoading = false
    }
}
