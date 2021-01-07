//
//  SearchViewPresenter.swift
//  orange
//
//  Created by Rizabek on 14.12.2020.
//

import Foundation

protocol SearchViewOutput: ViewOutput {
  func searchImage(queryString: String, page: Int)
  func didSelectCell(at indexPath: IndexPath)
}

protocol SearchViewInteractorOutput: class {
  func didSuccesSearch(with photosList: [SearchPhotos])
  func didFailSearch(with error: PresentableError)
}

final class SearchViewPresenter {
    
    // MARK: - Properties
  
    private let dataProvider: SearchViewDataProviderInput
    private var searchPhotos: [SearchPhotos]?
    weak var view: SearchViewInput?
    var interactor: SearchViewInteractorInput?
    var router: SearchRouterInput?
  
    // MARK: - Init
    
    init(dataProvider: SearchViewDataProviderInput) {
      self.dataProvider = dataProvider
    }
}

// MARK: - SearchViewOutput

extension SearchViewPresenter: SearchViewOutput {
    func searchImage(queryString: String, page: Int) {
      view?.showLoading()
      interactor?.getPhotoList(queryString: queryString, page: page)
    }
  
    func didSelectCell(at indexPath: IndexPath) {
      if let results = searchPhotos?[indexPath.row].results {
        let imageURL = results[indexPath.row].urls.full
        router?.openDetailt(with: imageURL)
      }
    }
}

// MARK: - SearchViewInteractorOutput

extension SearchViewPresenter: SearchViewInteractorOutput {
  func didSuccesSearch(with photosList: [SearchPhotos]) {
    view?.hideLoading()
    let viewModel = dataProvider.createViewModel(with: photosList)
    self.searchPhotos = photosList
    self.view?.update(with: viewModel)
  }
  
  func didFailSearch(with error: PresentableError) {
    view?.hideLoading()
    view?.showAlert(title: "Error =(",
                    message: error.localizedDescription,
                    actions: [AlertCancelAction],
                    style: .alert)
  }
}
