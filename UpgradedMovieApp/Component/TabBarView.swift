//
//  TabBarView.swift
//  UpgradedMovieApp
//
//  Created by Caroline Chan on 24/06/23.
//

import SwiftUI

struct Tab {
    var title: String
}

struct TabBarView: View {
    var fixed = true
    var tabs: [Tab]
    var geoWidth: CGFloat
    @Binding var selectedTab: Int
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            ScrollViewReader { proxy in
                VStack(spacing: 0) {
                    HStack(spacing: 0) {
                        ForEach(0 ..< tabs.count, id: \.self) { row in
                            Button(action: {
                                withAnimation {
                                    selectedTab = row
                                }
                            }, label: {
                                VStack(spacing: 0) {
                                    HStack {
                                        Text(tabs[row].title)
                                            .font(Font.system(size: 14, weight: .medium))
                                            .foregroundColor(Color.white)
                                            .padding()
                                    }
                                    .frame(width: fixed ? (geoWidth / CGFloat(tabs.count)) : .none, height: 52)
                                    // Bar Indicator
                                    Rectangle().fill(selectedTab == row ? Color(hex: "0296E5")! : Color.clear)
                                        .frame(height: 3)
                                }.fixedSize()
                            })
                            .accentColor(Color.white)
                            .buttonStyle(PlainButtonStyle())
                        }
                    }
                    .background(Color.clear)
                    .onChange(of: selectedTab) { target in
                        withAnimation {
                            proxy.scrollTo(target)
                        }
                    }
                }
            }
        }
        .frame(height: 55)
        .onAppear(perform: {
            UIScrollView.appearance().bounces = fixed ? false : true
        })
        .onDisappear(perform: {
            UIScrollView.appearance().bounces = true
        })
    }
}


struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView(fixed: true,
                   tabs: [.init(title: "Tab 1"),
                          .init(title: "Tab 2"),
                          .init(title: "Tab 3")],
                   geoWidth: 375,
                   selectedTab: .constant(0))
    }
}
