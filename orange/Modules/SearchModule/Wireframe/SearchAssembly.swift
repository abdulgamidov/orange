//
//  SearchAssembly.swift
//  orange
//
//  Created by Rizabek on 14.12.2020.
//

import UIKit

final class SearchAssembly: Assembly {
    
    static func assembleModule() -> UIViewController {
        
        let view = SearchViewController()
        let router = SearchRouter(transition: view)
        let dataProvider = SearchViewDataProvider()
        let presenter = SearchViewPresenter(dataProvider: dataProvider)
        let searchService = SearchServiceImp(networkService: NetworkService<SearchEndpoint>())
        let interactor = SearchViewInteractor(mainService: searchService)
                
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        
        return view
    }
}
