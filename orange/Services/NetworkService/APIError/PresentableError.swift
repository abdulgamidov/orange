//
//  PresentableError.swift
//  orange_wallpaper
//
//  Created by Rizabek on 11.12.2020.
//

import Foundation

protocol PresentableError where Self: Error {
    var userMessage: String { get }
    var isNetworkError: Bool { get }
}

extension APIError {
    var isNetworkError: Bool {
        switch self {
          case .noNetwork:    return true
          default:            return false
        }
    }
}
