//
//  UIViewController.swift
//  orange_wallpaper
//
//  Created by Rizabek on 11.12.2020.
//

import UIKit

extension UIViewController {
    
    func configure(tabBarIconName: String) {
        
        tabBarItem.title = ""
        tabBarItem.image = UIImage(named: tabBarIconName)?.withRenderingMode(.alwaysOriginal)
        tabBarItem.selectedImage = UIImage(named: "\(tabBarIconName)Selected")?.withRenderingMode(.alwaysOriginal)
    }
    
    func wrappedInNavigationController() -> UINavigationController {
        return UINavigationController(rootViewController: self)
    }
        
}
