//
//  ScrollableTabBarView.swift
//  UpgradedMovieApp
//
//  Created by Caroline Chan on 16/06/23.
//

import SwiftUI

struct ScrollableTabBarView: View {
    var items: [String]
    @State var selectedIndex = 0
    
    var body: some View {
        ScrollViewReader { scrollView in
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(items.indices, id: \.self) { index in
                        
                        Text(items[index])
                            .font(.subheadline)
                            .padding(.horizontal)
                            .padding(.vertical, 4)
                            .foregroundColor(.white)
                            .background(Capsule().foregroundColor(selectedIndex == index ? Color(hex: "0296E5")! : .clear))
                            .fontWeight(selectedIndex == index ? .semibold : .regular)
                            .onTapGesture {
                                withAnimation(.easeInOut) {
                                    selectedIndex = index
                                }
                            }
                    }
                }
            }
            .padding()
            .background(Color(hex: "3A3F47")!)
            .cornerRadius(15)
        }
    }
    
    struct ScrollableTabBarView_Previews: PreviewProvider {
        static var previews: some View {
            ScrollableTabBarView(items: ["Now Playing", "Coming Soon", "Box Office", "Box Office All Time"])
        }
    }
}
