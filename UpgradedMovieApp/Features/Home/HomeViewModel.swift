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
    @Published var topTVShows: TopTVShowsModel = TopTVShowsModel()
    @Published var popularMovies: PopularMoviesModel = PopularMoviesModel()
    @Published var popularTVShows: PopularTVShowsModel = PopularTVShowsModel()
    @Published var inTheaters: InTheaterModel = InTheaterModel()
    @Published var comingSoon: ComingSoonModel = ComingSoonModel()
    @Published var boxOffice: BoxOfficeModel = BoxOfficeModel()
    
    private var homeServices: HomeServicesProtocol
    
    init(homeServices: HomeServicesProtocol = HomeServices()) {
        self.homeServices = homeServices
    }
    
    func getTopMovies() async {
        guard let data = try? await homeServices.getTopMovies(endPoint: .getTopMovies) else { return }
        topMovies = data
    }
    
    func getTopTVShows() async {
        guard let data = try? await homeServices.getTopTVShows(endPoint: .getTopTVShows) else { return }
        topTVShows = data
    }
    
    func getPopularMovies() async {
        guard let data = try? await homeServices.getPopularMovies(endPoint: .getPopularMovies) else { return }
        popularMovies = data
    }
    
    func getPopularTVShows() async {
        guard let data = try? await homeServices.getPopularTVShows(endPoint: .getPopularTVShows) else { return }
        popularTVShows = data
    }
    
    func getInTheaters() async {
        guard let data = try? await homeServices.getInTheaters(endPoint: .getInTheaters) else { return }
        inTheaters = data
    }
    
    func getComingSoon() async {
        guard let data = try? await homeServices.getComingSoon(endPoint: .getComingSoon) else { return }
        comingSoon = data
    }
    
    func getBoxOffice() async {
        guard let data = try? await homeServices.getBoxOffice(endPoint: .getBoxOffice) else { return }
        boxOffice = data
    }
}
