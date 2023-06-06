//
//  SplashScreenView.swift
//  UpgradedMovieApp
//
//  Created by Caroline Chan on 05/06/23.
//

import SwiftUI

struct SplashScreenView: View {
    var body: some View {
        ZStack {
            Color(hex: "242A32")
                .ignoresSafeArea()
            
            Image("Logo")
        }
    }
}

struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}
