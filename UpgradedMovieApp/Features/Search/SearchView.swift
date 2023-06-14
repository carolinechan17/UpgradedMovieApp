//
//  SearchView.swift
//  UpgradedMovieApp
//
//  Created by Caroline Chan on 10/06/23.
//

import SwiftUI

struct SearchView: View {
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
            }
            .padding()
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
