//
//  ConfigurationFile.swift
//  UTube
//
//  Created by Novak Velimirovic on 13.3.24..
//

import Foundation
struct ConfigurationFile {
    static var apiKey: String {
        guard let path = Bundle.main.path(forResource: "APIKeys", ofType: "plist"),
              let plistData = FileManager.default.contents(atPath: path),
              let plistDictionary = try? PropertyListSerialization.propertyList(from: plistData, options: [], format: nil) as? [String: Any],
              let apiKey = plistDictionary["Your YouTubeAPIKey"] as? String else {
            fatalError("unable to access api key")
        }
        return apiKey
    }
}
