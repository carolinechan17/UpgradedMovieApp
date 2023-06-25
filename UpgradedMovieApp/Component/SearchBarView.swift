//
//  SearchBarView.swift
//  UpgradedMovieApp
//
//  Created by Caroline Chan on 05/06/23.
//

import SwiftUI

struct SearchBarView: View {
    @State var query: String = ""
    var body: some View {
        ZStack {
            Color(hex: "3A3F47")
            
            HStack {
                TextField("", text: $query)
                    .foregroundColor(.white)
                    .placeholder(when: query.isEmpty) {
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
