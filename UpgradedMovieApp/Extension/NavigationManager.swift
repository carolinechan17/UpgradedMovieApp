//
//  NavigationManager.swift
//  UpgradedMovieApp
//
//  Created by Caroline Chan on 23/06/23.
//

import Foundation
import SwiftUI

class NavigationManager: ObservableObject {
    @Published var path: NavigationPath = NavigationPath()
    
    func goToRoot() {
        guard !path.isEmpty else { return }
        path.removeLast(path.count)
    }
    
    func navigateTo(destination: Route) {
        path.append(destination)
    }
    
    func backToPrevious() {
        guard !path.isEmpty else { return }
        path.removeLast()
    }
}

enum Route: Hashable {
    case detailView(id: String)
    case searchView
}
