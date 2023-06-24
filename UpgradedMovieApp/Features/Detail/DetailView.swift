//
//  DetailView.swift
//  UpgradedMovieApp
//
//  Created by Caroline Chan on 23/06/23.
//

import SwiftUI

struct DetailView: View {
    @EnvironmentObject var navigationManager: NavigationManager
    @StateObject var detailVM: DetailViewModel = DetailViewModel()
    @State var selectedIndex: Int = 0
    
    var body: some View {
        ZStack {
            Color(hex: "242A32")
                .ignoresSafeArea()
            
            VStack {
                header
                
                TabBarView(tabs: [.init(title: "About Movie"), .init(title: "Cast"), .init(title: "Similar")], geoWidth: 360, selectedTab: $selectedIndex)
                    .padding(.bottom)
                
                Spacer()
            }
            .padding()
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
    }
}

extension DetailView {
    @ViewBuilder
    var header: some View {
        HStack {
            Image("movie")
                .resizable()
                .frame(width: 120, height: 150)
                .cornerRadius(10)
            
            VStack(alignment: .leading) {
                Text("Spiderman No Way Home")
                    .font(.system(size: 18))
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .padding(.bottom, 5)
                
                HStack {
                    Image(systemName: "calendar")
                        .foregroundColor(Color(hex: "92929D"))
                    
                    Text("24 June 2023")
                        .font(.system(size: 14))
                        .fontWeight(.medium)
                        .foregroundColor(Color(hex: "92929D"))
                }
                .padding(.bottom, 3)
                
                HStack {
                    Image(systemName: "clock")
                        .foregroundColor(Color(hex: "92929D"))
                    
                    Text("2hr 30 mins")
                        .font(.system(size: 14))
                        .fontWeight(.medium)
                        .foregroundColor(Color(hex: "92929D"))
                }
                .padding(.bottom, 3)
                
                HStack {
                    Image(systemName: "popcorn")
                        .foregroundColor(Color(hex: "92929D"))
                    
                    Text("Action, Adventure, Sci-fi")
                        .font(.system(size: 14))
                        .fontWeight(.medium)
                        .foregroundColor(Color(hex: "92929D"))
                }
                .padding(.bottom, 3)
            }
            .padding(.leading, 10)
            
            Spacer()
        }
    }
}
