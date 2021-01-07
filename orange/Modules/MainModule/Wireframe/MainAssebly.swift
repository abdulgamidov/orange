//
//  MainAssebly.swift
//  orange_wallpaper
//
//  Created by Rizabek on 12.12.2020.
//

import UIKit

final class MainAssebly: Assembly {
    
    static func assembleModule() -> UIViewController {
        
        let view = MainViewController()
        let router = MainRouter(transition: view)
        let dataProvider = MainViewDataProvider()
        let presenter = MainViewPresenter(dataProvider: dataProvider)
        let mainService = MainServiceImp(networkService: NetworkService<MainEndpoint>())
        let interactor = MainViewInteractor(mainService: mainService)
                
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        
        return view
    }
}
