//
//  SearchView.swift
//  UpgradedMovieApp
//
//  Created by Caroline Chan on 10/06/23.
//

import SwiftUI

struct SearchView: View {
    @State var query: String
    var body: some View {
        ZStack {
            Color(hex: "242A32")
                .ignoresSafeArea()
            
            VStack(alignment: .leading) {
                SearchBarView()
                
                Spacer()
            }
            .padding()
        }
        .navigationBarBackButtonHidden()
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(query: "mermaid")
    }
}
