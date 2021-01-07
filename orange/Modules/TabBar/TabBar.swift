//
//  TabBar.swift
//  orange_wallpaper
//
//  Created by Rizabek on 11.12.2020.
//

import UIKit

enum TabBarItem: Int, CaseIterable {
    case main = 0
    case search
    case favorite
    
    var iconName: String {
        
        switch self {
    
        case .main: return "mainIcon"
        case .search: return "categoriesIcon"
        case .favorite: return "favoriteIcon"
        }
    }
}

final class TabBar: UITabBarController {
    
  
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        drawSelf()
    }
    
    override var childForHomeIndicatorAutoHidden: UIViewController? {
        return nil
    }
    
    private func drawSelf() {
          
        viewControllers = TabBarItem.allCases.map {
            
            let viewController: UIViewController
            
            switch $0 {
        
            case .main:
              viewController = MainAssebly.assembleModule()
            case .search:
              viewController = SearchAssembly.assembleModule()
            case .favorite:
              viewController = UIViewController()
            }
            
            viewController.configure(tabBarIconName: $0.iconName)
            return viewController.wrappedInNavigationController()
        }
      
      tabBar.barTintColor = .black
      tabBar.tintColor = .black
    }
}
