//
//  DetailViewPresenter.swift
//  orange
//
//  Created by Rizabek on 14.12.2020.
//

import Foundation

protocol DetailViewOutput: ViewOutput {}

protocol DetailViewInteractorOutput: class {}

final class DetailViewPresenter {
    
    // MARK: - Properties
    weak var view: DetailViewInput?
    var interactor: DetailViewInteractorInput?
    var router: DetailRouterInput?
    let imageURL: String?
  
    // MARK: - Init
    
    init(imageURL: String) {
      self.imageURL = imageURL
    }
}

// MARK: - DetailViewOutput

extension DetailViewPresenter: DetailViewOutput {

    func viewIsReady() {
      if let url = imageURL {
        view?.setImage(imageURL: url)
      }
    }
}


// MARK: - DetailViewInteractorOutput
extension DetailViewPresenter: DetailViewInteractorOutput {}
