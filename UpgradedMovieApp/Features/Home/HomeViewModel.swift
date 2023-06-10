//
//  HomeViewModel.swift
//  UpgradedMovieApp
//
//  Created by Caroline Chan on 10/06/23.
//

import Foundation
import SwiftUI

@MainActor
class HomeViewModel: ObservableObject {
    @Published var topMovies: TopMovieModel = TopMovieModel()
    
    private var homeServices: HomeServicesProtocol
    
    init(homeServices: HomeServicesProtocol = HomeServices()) {
        self.homeServices = homeServices
    }
    
    func getTopMovies() async {
        guard let data = try? await homeServices.getTopMovies(endPoint: .getTopMovies) else { return }
        topMovies = data
    }
}