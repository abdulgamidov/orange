//
//  SplashViewPresenter.swift
//  orange_wallpaper
//
//  Created by Rizabek on 11.12.2020.
//

import Foundation

protocol SplashViewOutput: ViewOutput {}

final class SplashViewPresenter {
    
    // MARK: - Properties
    
    weak var view: SplashViewInput?
    var router: SplashRouterInput?
}


// MARK: - SplashViewOutput

extension SplashViewPresenter: SplashViewOutput {
    
    func viewIsReady() {
      DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
        self.router?.openTabBar()
      }
    }
}
