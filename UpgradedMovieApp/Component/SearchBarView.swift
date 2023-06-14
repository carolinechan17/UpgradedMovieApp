//
//  SearchBarView.swift
//  UpgradedMovieApp
//
//  Created by Caroline Chan on 05/06/23.
//

import SwiftUI

struct SearchBarView: View {
    @State var movieName: String = ""
    var body: some View {
        ZStack {
            Color(hex: "3A3F47")
            
            HStack {
                TextField("", text: $movieName)
                    .placeholder(when: movieName.isEmpty) {
                        Text("Search")
                            .foregroundColor(Color(hex: "67686D"))
                            .font(.system(size: 14))
                    }
                
                Image("Search")
            }
            .padding()
        }
        .frame(width: .infinity, height: 45)
        .cornerRadius(10)
    }
}

struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarView()
            .padding()
    }
}
