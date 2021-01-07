//
//  ServiceConstants.swift
//  orange_wallpaper
//
//  Created by Rizabek on 11.12.2020.
//

import Foundation

enum ServiceConstants {
    static let baseUrl = URL(string: "https://api.unsplash.com")
    static let accesKey = "ZzKczTqvrXUJ-CVOLaDjKfw9coAgrsTeUR6P4pPMBaU"
    static let requestTimeout: TimeInterval = 10
    static let resourceTimeout: TimeInterval = 10
    static let validCodes = (200 ..< 300)
}
