//
//  Assembly.swift
//  orange_wallpaper
//
//  Created by Rizabek on 11.12.2020.
//

import UIKit

protocol TransitionModel { }

protocol Assembly {
    static func assembleModule() -> UIViewController
    static func assembleModule(with model: TransitionModel) -> UIViewController
}

extension Assembly {
    
    static func assembleModule() -> UIViewController {
        fatalError("implement assembleModule() in ModuleAssembly")
    }

    static func assembleModule(with model: TransitionModel) -> UIViewController {
        fatalError("implement assembleModule(with model: TransitionModel) in ModuleAssembly")
    }
}
