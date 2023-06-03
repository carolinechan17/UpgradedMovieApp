//
//  ConfigManager.swift
//  UpgradedMovieApp
//
//  Created by Caroline Chan on 03/06/23.
//

import Foundation
class ConfigManager {
    static let shared = ConfigManager()
    
    init() {}

    func getValue(forKey key: ConfigValue) -> String {
        guard let value = Bundle.main.object(forInfoDictionaryKey: key.rawValue) as? String else {
            return ""
        }
        return value
    }
}

extension ConfigManager {
    enum ConfigValue: String {
        case baseApi    = "BaseApi"
        case userToken  = "UserToken"
        case passToken  = "PassToken"
        case baseGeoApi = "BaseGeoApi"
        case keyGeoApi  = "KeyGeoApi"
        case baseMockApi = "BaseMockApi"
    }
}
