//
//  CastView.swift
//  UpgradedMovieApp
//
//  Created by Caroline Chan on 24/06/23.
//

import SwiftUI

struct CastView: View {
    var body: some View {
        VStack {
            Image(systemName: "person.circle")
                .resizable()
                .frame(width: 100, height: 100)
                .foregroundColor(.white)
            Text("Tom Holland")
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(.white)
            Text("as")
                .font(.system(size: 14))
                .foregroundColor(.white)
            Text("John Doe")
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(.white)
        }
        .padding(.bottom)
    }
}

struct CastView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
            
            CastView()
        }
    }
}
