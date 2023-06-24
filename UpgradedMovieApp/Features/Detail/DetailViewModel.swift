//
//  DetailViewModel.swift
//  UpgradedMovieApp
//
//  Created by Caroline Chan on 23/06/23.
//

import Foundation
import SwiftUI

@MainActor
class DetailViewModel: ObservableObject {
    @Published var detail: DetailModel = DetailModel()
    
    private var detailServices: DetailServicesProtocol
    
    init(detailServices: DetailServicesProtocol = DetailServices()) {
        self.detailServices = detailServices
    }
    
    func getDetail(id: String) async {
        guard let data = try? await detailServices.getDetail(endPoint: .getDetail(id: id)) else { return }
        detail = data
    }
    
    func dateFormatter(date: String) -> String {
        let stringToDate = DateFormatter()
        stringToDate.dateFormat = "yy-MM-dd"
        
        let dateToString = DateFormatter()
        dateToString.dateFormat = "d MMM y"
        return dateToString.string(from: stringToDate.date(from: date) ?? Date())
    }
}
