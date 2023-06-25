//
//  SearchView.swift
//  UpgradedMovieApp
//
//  Created by Caroline Chan on 10/06/23.
//

import SwiftUI

struct SearchView: View {
    @StateObject var searchVM: SearchViewModel = SearchViewModel()
    @State var query: String = ""
    var body: some View {
        ZStack {
            Color(hex: "242A32")
                .ignoresSafeArea()
            
            VStack() {
                SearchBarView(query: query)
                    .onSubmit {
                        Task {
                            await searchVM.searchByQuery(query: query)
                        }
                    }
                
                if searchVM.result.results.isEmpty {
                    Spacer()
                    Image("EmptySearch")
                    Text("We Are Sorry, \nWe Can Not Find The Movie :(")
                        .foregroundColor(.white)
                        .font(.system(size: 18, weight: .semibold))
                        .multilineTextAlignment(.center)
                    Text("Find your movie by \ntyping the title")
                        .foregroundColor(Color.white)
                        .font(.system(size: 14, weight: .regular))
                        .multilineTextAlignment(.center)
                } else {
                    ScrollView(showsIndicators: false) {
                        ForEach(searchVM.result.results, id: \.self) { item in
                            HStack {
                                ZStack {
                                    ProgressView()
                                    
                                    AsyncImage(url: URL(string: item.image)) { image in
                                        image
                                            .resizable()
                                            .frame(width: 120, height: 150)
                                            .scaledToFit()
                                    } placeholder: {
                                        ProgressView()
                                    }
                                }
                                .frame(width: 120, height: 150)
                                .background(Color.gray)
                                .cornerRadius(10)
                                
                                VStack {
                                    Text(item.title)
                                        .font(.system(size: 18))
                                        .fontWeight(.semibold)
                                        .foregroundColor(.white)
                                        .padding(.bottom, 5)
                                    
                                    Text(item.description)
                                        .font(.system(size: 14))
                                        .fontWeight(.medium)
                                        .foregroundColor(Color(hex: "92929D"))
                                        .multilineTextAlignment(.leading)
                                }
                                
                                Spacer()
                            }
                        }
                    }
                }
                
                Spacer()
            }
            .padding()
        }
        .navigationBarBackButtonHidden()
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
