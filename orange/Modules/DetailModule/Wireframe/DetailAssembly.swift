//
//  DetailAssembly.swift
//  orange
//
//  Created by Rizabek on 14.12.2020.
//

import UIKit

final class DetailAssembly: Assembly {
    
    static func assembleModule(with model: TransitionModel) -> UIViewController {
        let model = (model as! Model)
        let view = DetailViewController()
        let router = DetailRouter(transition: view)
        let presenter = DetailViewPresenter(imageURL: model.imageURL)
        let interactor = DetailViewInteractor()
                
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        
        return view
    }
}


// MARK: - Model

extension DetailAssembly {
    
    struct Model: TransitionModel {
      let imageURL: String
    }
}
