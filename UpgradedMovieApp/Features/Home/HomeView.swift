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
            
            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading) {
                    Text("What do you want to watch?")
                        .font(.system(size: 18))
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                    
                    SearchBarView()
                    
                    ScrollableTabBarView(items: ["Top Movies", "Top TV Shows", "Popular Movies", "Popular TV Shows", "Now Playing", "Coming Soon", "Box Office", "Box Office All Time"], selectedIndex: $selectedIndex)
                        .padding(.vertical)
                    
                    TabView(selection: $selectedIndex) {
                        Image(systemName: "house")
                            .resizable()
                            .frame(width: 100, height: 100)
                            .tag(0)
                        
                        Text("top tv show")
                            .foregroundColor(.white)
                            .tag(1)
                        
                        Text("popular movie")
                            .foregroundColor(.white)
                            .tag(2)
                        Text("popular tv show")
                            .foregroundColor(.white)
                            .tag(3)
                        Text("now playing")
                            .foregroundColor(.white)
                            .tag(4)
                        Text("coming soon")
                            .foregroundColor(.white)
                            .tag(5)
                        Text("box office")
                            .foregroundColor(.white)
                            .tag(6)
                        Text("box office all time")
                            .foregroundColor(.white)
                            .tag(7)
                    }
                    .padding(.vertical)
                    .onAppear {
                        UITabBar.appearance().isHidden = true
                    }
                    
                    Spacer()
                }
                .padding()
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
