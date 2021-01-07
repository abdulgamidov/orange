//
//  SceneDelegate.swift
//  orange_wallpaper
//
//  Created by Rizabek on 11.12.2020.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

  var window: UIWindow?

  func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    
    guard let windowScence = (scene as? UIWindowScene) else { return }
    window = UIWindow(frame: windowScence.coordinateSpace.bounds)
    window?.windowScene = windowScence
    
    let splashView = SplashAssebly.assembleModule()
    window?.rootViewController = splashView
    window?.makeKeyAndVisible()
  }
}

