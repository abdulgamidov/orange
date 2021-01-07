//
//  SplashAssebly.swift
//  orange_wallpaper
//
//  Created by Rizabek on 11.12.2020.
//

import UIKit

final class SplashAssebly: Assembly {
    
    static func assembleModule() -> UIViewController {
        
        let view = SplashViewController()
        let router = SplashRouter(transition: view)
        let presenter = SplashViewPresenter()
                
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
              
        return view
        
    }
}

