//
//  SplashRouter.swift
//  orange_wallpaper
//
//  Created by Rizabek on 11.12.2020.
//

import UIKit

protocol SplashRouterInput {
    func openTabBar()
}

final class SplashRouter {
    
    // MARK: - Properties
    
    weak var transition: ModuleTransitionHandler?
    
    // MARK: - Init
    
    init(transition: ModuleTransitionHandler?) {
        self.transition = transition
    }
    
}


// MARK: - SplashRouterInput
extension SplashRouter: SplashRouterInput {
  func openTabBar() {
    transition?.openTabBar()
  }
}
