//
//  ParsableError.swift
//  orange_wallpaper
//
//  Created by Rizabek on 11.12.2020.
//

import Foundation

struct ParsableError: Decodable, PresentableError {
    
    // MARK: - Properties
    
    private let message: String
    let type: String
    let errors: [DetailError]?
    
    // MARK: - Nested struct
    
    struct DetailError: Decodable {
        let name: String
        let message: String
    }
    
    // MARK: - PresentableError
    
    var userMessage: String {
        return message
    }
    
    var isNetworkError: Bool {
        return false
    }
}
