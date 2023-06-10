//
//  HomeView.swift
//  UpgradedMovieApp
//
//  Created by Caroline Chan on 10/06/23.
//

import SwiftUI

struct HomeView: View {
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
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
