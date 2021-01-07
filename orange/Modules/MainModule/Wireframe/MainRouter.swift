//
//  MainRouter.swift
//  orange_wallpaper
//
//  Created by Rizabek on 12.12.2020.
//

import UIKit

protocol MainRouterInput {
  func openDetail(imageURL: String)
}

final class MainRouter {
    
    // MARK: - Properties
    
    weak var transition: ModuleTransitionHandler?
    
    // MARK: - Init
    
    init(transition: ModuleTransitionHandler?) {
        self.transition = transition
    }
    
}


// MARK: - MainRouterInput
extension MainRouter: MainRouterInput {
  func openDetail(imageURL: String) {
    transition?.push(with: DetailAssembly.Model(imageURL: imageURL), openModuleType: DetailAssembly.self)
  }
  

}
