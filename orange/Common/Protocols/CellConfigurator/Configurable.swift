//
//  Configurable.swift
//  orange_wallpaper
//
//  Created by Rizabek on 13.12.2020.
//

protocol Configurable {
  
    associatedtype Model
    func configure(with model: Model)
}
