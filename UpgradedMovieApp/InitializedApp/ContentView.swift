//
//  ContentView.swift
//  UpgradedMovieApp
//
//  Created by Caroline Chan on 03/06/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var navigationManager: NavigationManager = NavigationManager()
    @State var isActive: Bool = false
    var body: some View {
        NavigationStack(path: $navigationManager.path){
            ZStack {
                if self.isActive {
                    HomeView()
                        .environmentObject(navigationManager)
                } else {
                    SplashScreenView()
                }
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                    withAnimation {
                        self.isActive = true
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
