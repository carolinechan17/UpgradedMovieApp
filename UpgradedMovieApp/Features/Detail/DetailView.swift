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
    var id: String
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        ZStack {
            Color(hex: "242A32")
                .ignoresSafeArea()
            
            VStack {
                header
                
                TabBarView(tabs: [.init(title: "About Movie"), .init(title: "Cast"), .init(title: "Similar")], geoWidth: 360, selectedTab: $selectedIndex)
                    .padding(.bottom)
                
                TabView(selection: $selectedIndex) {
                    aboutMovie
                        .tag(0)
                    
                    castList
                        .tag(1)
                    
                    similarList
                        .tag(2)
                }
                .onAppear {
                    UITabBar.appearance().isHidden = true
                    UINavigationBar.appearance().isHidden = true
                }
                
                Spacer()
            }
            .ignoresSafeArea(.all, edges: .bottom)
            .padding()
        }
        .task {
            await detailVM.getDetail(id: id)
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(id: "tt1375666")
    }
}

extension DetailView {
    @ViewBuilder
    var header: some View {
        HStack {
            ZStack {
                Image("movie")
                    .resizable()
                    .frame(width: 120, height: 150)
                .cornerRadius(10)
                
                VStack {
                    Spacer()
                    
                    HStack {
                        Image(systemName: "star.fill")
                            .resizable()
                            .frame(width: 14, height: 14)
                            .foregroundColor(.yellow)
                        Text("4.5")
                            .font(.system(size: 14))
                            .fontWeight(.semibold)
                            .foregroundColor(.yellow)
                    }
                    .padding(.bottom, 3)
                }
            }
            .frame(width: 120, height: 150)
            
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

extension DetailView {
    @ViewBuilder
    var aboutMovie: some View {
        ZStack {
            Color(hex: "242A32")
                .ignoresSafeArea()
            
            VStack {
                HStack {
                    Image(systemName: "note.text")
                        .foregroundColor(.white)
                    Text("Synopsis")
                        .font(.system(size: 16))
                        .fontWeight(.medium)
                        .foregroundColor(.white)
                    Spacer()
                }
                .padding(.bottom, 3)
                
                Text("A thief who steals corporate secrets through the use of dream-sharing technology is given the inverse task of planting an idea into the mind of a C.E.O., but his tragic past may doom the project and his team to disaster.")
                    .font(.system(size: 14))
                    .fontWeight(.regular)
                    .foregroundColor(.white)
                
                HStack {
                    Image(systemName: "tag")
                        .foregroundColor(.white)
                    Text("Keywords")
                        .font(.system(size: 16))
                        .fontWeight(.medium)
                        .foregroundColor(.white)
                    Spacer()
                }
                .padding(.top, 6)
                .padding(.bottom, 3)
                
                TagView(tags: ["dream", "ambiguous ending", "subconscious", "mindbender", "surprise ending"])
                
                Spacer()
            }
        }
    }
}

extension DetailView {
    @ViewBuilder
    var castList: some View {
        ZStack {
            Color(hex: "242A32")
                .ignoresSafeArea()
            
            ScrollView(showsIndicators: false) {
                LazyVGrid(columns: columns) {
                    ForEach(0..<12, id: \.self) { _ in
                        CastView()
                    }
                }
            }
        }
    }
}

extension DetailView {
    @ViewBuilder
    var similarList: some View {
        ZStack {
            Color(hex: "242A32")
                .ignoresSafeArea()
            
            ScrollView(.horizontal) {
                HStack(spacing: 10) {
                    ForEach(0..<10, id: \.self) { _ in
                        VStack {
                            Image("movie")
                                .resizable()
                                .frame(width: 120, height: 150)
                            .cornerRadius(10)
                            
                            Text("Interstellar")
                                .foregroundColor(.white)
                                .font(.system(size: 16))
                                .fontWeight(.medium)
                            
                            Spacer()
                        }
                    }
                }
            }
        }
    }
}
