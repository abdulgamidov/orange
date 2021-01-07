//
//  Photo.swift
//  orange
//
//  Created by Rizabek on 14.12.2020.
//

import Foundation

struct Photo: Decodable {
    let id: String
    let width, height: Int
    let urls: Urls
}

struct SearchPhotos: Decodable {
    let results: [SearchResult]
}

struct SearchResult: Decodable {
  let urls: Urls
}

struct Urls: Decodable {
    let raw, full, regular, small: String
    let thumb: String
}
