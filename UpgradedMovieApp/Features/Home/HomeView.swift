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
            
            VStack(alignment: .leading) {
                Text("What do you want to watch?")
                    .poppinsBold(color: Color(hex: "FFFFFF")!, size: 18)
                
                SearchBarView()
            }
            .padding()
            .task {
                await homeVM.getTopMovies()
                print($homeVM.$topMovies)
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
