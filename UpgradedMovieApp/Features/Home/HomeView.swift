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
                    
                    ScrollableTabBarView(items: ["Top Movies", "Top TV Shows", "Popular Movies", "Popular TV Shows", "Now Playing", "Coming Soon", "Box Office", "Box Office All Time"])
                        .padding(.vertical)
                    
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
