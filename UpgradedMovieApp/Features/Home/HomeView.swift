//
//  HomeView.swift
//  UpgradedMovieApp
//
//  Created by Caroline Chan on 10/06/23.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var homeVM: HomeViewModel = HomeViewModel()
    
    var body: some View {
        ZStack {
            Color(hex: "242A32")
                .ignoresSafeArea()
            
            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading) {
                    Text("What do you want to watch?")
                        .font(.system(size: 18))
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                    
                    SearchBarView()
                    
                    topMoviesSection
                    
                    topTVShowsSection
                    
                    Spacer()
                }
                .padding()
                .task {
                    await homeVM.getTopMovies()
                    await homeVM.getTopTVShows()
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

extension HomeView {
    @ViewBuilder
    private var topMoviesSection: some View {
        Text("Top 10 Movies")
            .font(.system(size: 18))
            .fontWeight(.semibold)
            .foregroundColor(.white)
            .padding(.top)
        
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(homeVM.topMovies.items.prefix(10), id: \.self) { item in
                    ZStack {
                        ProgressView()
                        
                        AsyncImage(url: URL(string: item.image)) { image in
                            image
                                .resizable()
                                .frame(width: 150, height: 200)
                                .scaledToFit()
                        } placeholder: {
                            Color.clear
                        }
                    }
                    .frame(width: 150, height: 200)
                    .cornerRadius(10)
                }
            }
            .padding(.bottom)
        }
    }
}

extension HomeView {
    @ViewBuilder
    private var topTVShowsSection: some View {
        Text("Top 10 TV Shows")
            .font(.system(size: 18))
            .fontWeight(.semibold)
            .foregroundColor(.white)
            .padding(.top)
        
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(homeVM.topTVShows.items.prefix(10), id: \.self) { item in
                    ZStack {
                        ProgressView()
                        
                        AsyncImage(url: URL(string: item.image)) { image in
                            image
                                .resizable()
                                .frame(width: 150, height: 200)
                                .scaledToFit()
                        } placeholder: {
                            Color.clear
                        }
                    }
                    .frame(width: 150, height: 200)
                    .cornerRadius(10)
                }
            }
            .padding(.bottom)
        }
    }
}
