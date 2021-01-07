//
//  MainList.swift
//  orange_wallpaper
//
//  Created by Rizabek on 13.12.2020.
//

import Foundation

// MARK: - MainList
struct MainList: Codable {
    let categoriesFavorites, categoriesHot: [Categories]
    let categoriesToplive, topLive: [Live]

    enum CodingKeys: String, CodingKey {
        case categoriesFavorites = "categories_favorites"
        case categoriesHot = "categories_hot"
        case categoriesToplive = "categories_toplive"
        case topLive = "top_live"
    }
}

// MARK: - Categories
struct Categories: Codable {
    let link, title, image: String
}

// MARK: - Live
struct Live: Codable {
    let previewURL, url: String

    enum CodingKeys: String, CodingKey {
        case previewURL = "preview_url"
        case url
    }
}
