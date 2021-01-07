//
//  MainViewPresenter.swift
//  orange_wallpaper
//
//  Created by Rizabek on 12.12.2020.
//

import Foundation

protocol MainViewOutput: ViewOutput {
  func loadMorePhoto(page: Int, order: String)
  func didSelectCell(at indexPath: IndexPath)
}

protocol MainViewInteractorOutput: class {
  func didSuccesLoadPhoto(with photosList: [Photo])
  func didFailLoadPhoto(with error: PresentableError)
}

final class MainViewPresenter {
    
    // MARK: - Properties
    private let dataProvider: MainViewDataProviderInput
    private var photos: [Photo]?
    weak var view: MainViewInput?
    var interactor: MainViewInteractorInput?
    var router: MainRouterInput?
  
    // MARK: - Init
    
    init(dataProvider: MainViewDataProviderInput) {
      self.dataProvider = dataProvider
    }
}

// MARK: - MainViewOutput
extension MainViewPresenter: MainViewOutput {
  
    func loadMorePhoto(page: Int, order: String) {
      view?.showLoading()
      interactor?.getPhotoList(page: page, order: "popular")
    }
  
    func didSelectCell(at indexPath: IndexPath) {
      if let image = photos?[indexPath.row].urls.full {
        router?.openDetail(imageURL: image)
      }
    }
  
    func viewIsReady() {
      view?.showLoading()
      interactor?.getPhotoList(page: 1, order: "popular")
    }
}


// MARK: - MainViewInteractorOutput
extension MainViewPresenter: MainViewInteractorOutput {
  func didSuccesLoadPhoto(with photosList: [Photo]) {
    self.view?.hideLoading()
    let viewModel = dataProvider.createViewModel(with: photosList)
    photos = photosList
    self.view?.update(with: viewModel)
  }
  
  func didFailLoadPhoto(with error: PresentableError) {
    view?.hideLoading()
    view?.showAlert(title: "Error =(",
                    message: error.localizedDescription,
                    actions: [AlertCancelAction],
                    style: .alert)
  }
}
