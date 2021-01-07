//
//  DetailRouter.swift
//  orange
//
//  Created by Rizabek on 14.12.2020.
//

import UIKit

protocol DetailRouterInput {}

final class DetailRouter {
    
    // MARK: - Properties
    
    weak var transition: ModuleTransitionHandler?
    
    // MARK: - Init
    
    init(transition: ModuleTransitionHandler?) {
        self.transition = transition
    }
    
}


// MARK: - DetailRouterInput
extension DetailRouter: DetailRouterInput {

}
