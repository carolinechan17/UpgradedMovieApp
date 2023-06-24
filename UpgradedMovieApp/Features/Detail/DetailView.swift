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
    @State var keywordList: [String] = []
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
            .task {
                await detailVM.getDetail(id: id)
            }
            .ignoresSafeArea(.all, edges: .bottom)
            .padding()
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
                ZStack {
                    ProgressView()
                    
                    AsyncImage(url: URL(string: detailVM.detail.image)) { image in
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
                    Spacer()
                    
                    HStack {
                        Image(systemName: "star.fill")
                            .resizable()
                            .frame(width: 14, height: 14)
                            .foregroundColor(.yellow)
                        Text(detailVM.detail.imDBRating)
                            .font(.system(size: 14))
                            .fontWeight(.semibold)
                            .foregroundColor(.yellow)
                    }
                    .padding(.bottom, 3)
                }
            }
            .frame(width: 120, height: 150)
            
            VStack(alignment: .leading) {
                Text(detailVM.detail.title)
                    .font(.system(size: 18))
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .padding(.bottom, 5)
                
                HStack {
                    Image(systemName: "calendar")
                        .foregroundColor(Color(hex: "92929D"))
                    
                    Text(detailVM.dateFormatter(date: detailVM.detail.releaseDate))
                        .font(.system(size: 14))
                        .fontWeight(.medium)
                        .foregroundColor(Color(hex: "92929D"))
                }
                .padding(.bottom, 3)
                
                HStack {
                    Image(systemName: "clock")
                        .foregroundColor(Color(hex: "92929D"))
                    
                    Text(detailVM.detail.runtimeStr)
                        .font(.system(size: 14))
                        .fontWeight(.medium)
                        .foregroundColor(Color(hex: "92929D"))
                }
                .padding(.bottom, 3)
                
                HStack {
                    Image(systemName: "popcorn")
                        .foregroundColor(Color(hex: "92929D"))
                    
                    Text(detailVM.detail.genres)
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
                
                Text(detailVM.detail.plot)
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
                
                TagView(tags: detailVM.detail.keywordList)
                
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
                    ForEach(detailVM.detail.actorList, id: \.self) { item in
                        CastView(image: item.image, name: item.name, character: item.asCharacter)
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
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 10) {
                    ForEach(detailVM.detail.similars, id: \.self) { item in
                        VStack {
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
                            
                            Text(item.title)
                                .frame(width: 120, height: .infinity)
                                .multilineTextAlignment(.center)
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
