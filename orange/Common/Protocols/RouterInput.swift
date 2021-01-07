//
//  RouterInput.swift
//  orange_wallpaper
//
//  Created by Rizabek on 11.12.2020.
//

protocol RouterInput {
    var transition: ModuleTransitionHandler? { get }
    func dismissModule()
}

extension RouterInput {
    
    func dismissModule() {
        transition?.closeModule()
    }
}
