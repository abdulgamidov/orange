//
//  SearchRouter.swift
//  orange
//
//  Created by Rizabek on 14.12.2020.
//

import UIKit

protocol SearchRouterInput {
  func openDetailt(with imageURL: String)
}

final class SearchRouter {
    
    // MARK: - Properties
    
    weak var transition: ModuleTransitionHandler?
    
    // MARK: - Init
    
    init(transition: ModuleTransitionHandler?) {
        self.transition = transition
    }
}

// MARK: - SearchRouterInput
extension SearchRouter: SearchRouterInput {
  func openDetailt(with imageURL: String) {
    transition?.push(with: DetailAssembly.Model(imageURL: imageURL), openModuleType: DetailAssembly.self)
  }
}
