//
//  NSObject+ClassName.swift
//  orange_wallpaper
//
//  Created by Rizabek on 13.12.2020.
//

import Foundation

extension NSObject {
    
    static var className: String {
        return String(describing: self)
    }
    var className: String {
        return String(describing: type(of: self))
    }
}
