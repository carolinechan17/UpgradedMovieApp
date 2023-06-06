//
//  ContentView.swift
//  UpgradedMovieApp
//
//  Created by Caroline Chan on 03/06/23.
//

import SwiftUI

struct ContentView: View {
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
