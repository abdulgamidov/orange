//
//  ModuleTransitionHandler.swift
//  orange_wallpaper
//
//  Created by Rizabek on 11.12.2020.
//

import UIKit

protocol ModuleTransitionHandler: AnyObject {
    func openTabBar()
    func present<ModuleType: Assembly>(with model: TransitionModel, openModuleType: ModuleType.Type)
    func present<ModuleType: Assembly>(moduleType: ModuleType.Type)
    func show<ModuleType: Assembly>(with model: TransitionModel, openModuleType: ModuleType)
    func push<ModuleType: Assembly>(with model: TransitionModel, openModuleType: ModuleType.Type)
    func push<ModuleType: Assembly>(moduleType: ModuleType.Type)
    func closeModule()
    func closeModule(_ completion: (() -> Void)?)
}

extension UIViewController: ModuleTransitionHandler {
  
    func openTabBar() {
      guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
          let sceneDelegate = windowScene.delegate as? SceneDelegate
        else {
          return
        }
      sceneDelegate.window?.rootViewController = TabBar()
    }
  
    func present<ModuleType: Assembly>(with model: TransitionModel, openModuleType: ModuleType.Type) {
        let view = ModuleType.assembleModule(with: model)
        present(view, animated: true, completion: nil)
    }
    
    func present<ModuleType: Assembly>(moduleType: ModuleType.Type) {
        let view = ModuleType.assembleModule()
        present(view, animated: true, completion: nil)
    }
    
    func show<ModuleType: Assembly>(with model: TransitionModel, openModuleType: ModuleType) {
        let view = ModuleType.assembleModule(with: model)
        show(view, sender: nil)
    }
    
    func pop() {
        navigationController?.popViewController(animated: true)
    }
    
    func popToRootViewController() {
        navigationController?.popToRootViewController(animated: true)
    }
    
    func push<ModuleType: Assembly>(with model: TransitionModel, openModuleType: ModuleType.Type) {
        let view = ModuleType.assembleModule(with: model)
        navigationController?.pushViewController(view, animated: true)
    }
    
    func push<ModuleType: Assembly>(moduleType: ModuleType.Type) {
        let view = ModuleType.assembleModule()
        navigationController?.pushViewController(view, animated: true)
    }
    
    func closeModule() {
        closeModule(nil)
    }
    
    func closeModule(_ completion: (() -> Void)?) {
        dismiss(animated: true, completion: completion)
    }
    
}
