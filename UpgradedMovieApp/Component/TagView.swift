//
//  TagView.swift
//  UpgradedMovieApp
//
//  Created by Caroline Chan on 24/06/23.
//

import SwiftUI

struct TagView: View {
    @State var tags: [String]
    var body: some View {
        HStack{
            ForEach(tags, id: \.self) { tag in
                Text(tag.capitalized)
                    .font(.system(size: 14, weight: .medium))
                    .foregroundColor(.white)
                    .padding(10)
                    .background(Color(hex: "3A3F47"))
                    .cornerRadius(10)
            }
            
            Spacer()
        }
    }
}

struct TagView_Previews: PreviewProvider {
    static var previews: some View {
        TagView(tags: ["adventure", "sci-fi", "dream"])
    }
}
