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
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
    }
}
