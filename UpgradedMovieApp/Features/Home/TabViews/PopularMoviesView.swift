//
//  PopularMoviesView.swift
//  UpgradedMovieApp
//
//  Created by Caroline Chan on 18/06/23.
//

import SwiftUI

struct PopularMoviesView: View {
    @EnvironmentObject var navigationManager: NavigationManager
    @StateObject private var homeVM: HomeViewModel = HomeViewModel()
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        ZStack {
            Color(hex: "242A32")
                .ignoresSafeArea()
            
            ScrollView(showsIndicators: false) {
                LazyVGrid(columns: columns) {
                    ForEach(homeVM.popularMovies.items, id: \.self) { item in
                        ZStack {
                            ProgressView()
                            
                            AsyncImage(url: URL(string: item.image)) { image in
                                image
                                    .resizable()
                                    .frame(width: 110, height: 150)
                                    .scaledToFit()
                            } placeholder: {
                                Color.clear
                            }
                        }
                        .frame(width: 110, height: 150)
                        .cornerRadius(10)
                        .onTapGesture {
                            navigationManager.navigateTo(destination: .detailView(id: item.id))
                        }
                    }
                }
                .padding(.vertical)
            }
            .task {
                await homeVM.getPopularMovies()
            }
        }
    }
}

struct PopularMoviesView_Previews: PreviewProvider {
    static var previews: some View {
        PopularMoviesView()
    }
}
