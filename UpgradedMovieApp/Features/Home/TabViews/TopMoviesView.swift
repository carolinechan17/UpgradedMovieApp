//
//  TopMoviesView.swift
//  UpgradedMovieApp
//
//  Created by Caroline Chan on 17/06/23.
//

import SwiftUI

struct TopMoviesView: View {
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
            
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(homeVM.topMovies.items, id: \.self) { item in
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
                    }
                }
                .padding(.vertical)
            }
            .task {
                await homeVM.getTopMovies()
            }
        }
    }
}

struct TopMoviesView_Previews: PreviewProvider {
    static var previews: some View {
        TopMoviesView()
    }
}
