//
//  CastView.swift
//  UpgradedMovieApp
//
//  Created by Caroline Chan on 24/06/23.
//

import SwiftUI

struct CastView: View {
    var image: String
    var name: String
    var character: String
    var body: some View {
        VStack {
            ZStack {
                ProgressView()
                
                AsyncImage(url: URL(string: image)) { image in
                    image
                        .resizable()
                        .scaledToFill()
                } placeholder: {
                    ProgressView()
                }
            }
            .frame(width: 90, height: 90)
            .background(Color.gray)
            .clipShape(Circle())
            Text(name)
                .frame(width: 120, height: .infinity)
                .multilineTextAlignment(.center)
                .font(.system(size: 14, weight: .medium))
                .foregroundColor(.white)
            Text("as")
                .font(.system(size: 12))
                .foregroundColor(.white)
            Text(character)
                .frame(width: 120, height: .infinity)
                .multilineTextAlignment(.center)
                .font(.system(size: 14, weight: .medium))
                .foregroundColor(.white)
        }
        .padding(.bottom)
    }
}

struct CastView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
            
            CastView(image: "https://m.media-amazon.com/images/M/MV5BMjI0MTg3MzI0M15BMl5BanBnXkFtZTcwMzQyODU2Mw@@._V1_Ratio1.0000_AL_.jpg", name: "Leonardo Dicaprio", character: "Cobb")
        }
    }
}
