//
//  HomeView.swift
//  UpgradedMovieApp
//
//  Created by Caroline Chan on 10/06/23.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var homeVM: HomeViewModel = HomeViewModel()
    @State var selectedIndex: Int = 0
    
    var body: some View {
        ZStack {
            Color(hex: "242A32")
                .ignoresSafeArea()
            
            VStack(alignment: .leading) {
                Text("What do you want to watch?")
                    .font(.system(size: 18))
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                
                SearchBarView()
                
                ScrollableTabBarView(items: ["Top Movies", "Top TV Shows", "Popular Movies", "Popular TV Shows", "Now Playing", "Coming Soon", "Box Office"], selectedIndex: $selectedIndex)
                    .padding(.top)
                
                TabView(selection: $selectedIndex) {
                    TopMoviesView()
                        .tag(0)

                    TopTVShowsView()
                        .tag(1)
                    
                    PopularMoviesView()
                        .tag(2)
                    
                    PopularTVShowsView()
                        .tag(3)
                    
                    InTheatersView()
                        .tag(4)
                    
                    ComingSoonView()
                        .tag(5)
                    
                    BoxOfficeView()
                        .tag(6)
                }
                .onAppear {
                    UITabBar.appearance().isHidden = true
                    UINavigationBar.appearance().isHidden = true
                }
                
                Spacer()
            }
            .padding()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
