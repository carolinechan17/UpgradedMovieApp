//
//  ContentView.swift
//  UpgradedMovieApp
//
//  Created by Caroline Chan on 03/06/23.
//

import SwiftUI

struct ContentView: View {
    @State var isActive: Bool = false
    var body: some View {
        ZStack {
            if self.isActive {
                HomeView()
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
